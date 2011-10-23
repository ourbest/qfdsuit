package com.demx.cfg.util;

import org.apache.log4j.Logger;
import org.dom4j.dom.DOMDocumentFactory;
import org.dom4j.io.*;
import org.w3c.dom.Document;
import org.xml.sax.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;


public final class XMLHelper {

    public static SAXReader createSAXReader(String file, List errorsList, boolean valid) {
        SAXReader reader = new SAXReader();
        reader.setEntityResolver(DTD_RESOLVER);
        reader.setErrorHandler(new ErrorLogger(file, errorsList));
        reader.setMergeAdjacentText(true);
        reader.setValidation(valid);
        return reader;
    }

    public static DOMReader createDOMReader() {
        DOMReader reader = new DOMReader();
        return reader;
    }

    private static Logger log = Logger.getLogger(XMLHelper.class);
    private static final EntityResolver DTD_RESOLVER = new DTDEntityResolver();

    public static class ErrorLogger
            implements ErrorHandler {
        private String file;
        private List errors;

        /**
         * ��������ʹ��XML�ļ���error List
         *
         * @param file   String
         * @param errors List
         */
        ErrorLogger(String file, List errors) {
            this.file = file;
            this.errors = errors;
        }

        public void error(SAXParseException error) {
            log.error("Error parsing XML: " + file + '(' + error.getLineNumber() + ") " + error.getMessage());
            errors.add(error);
        }

        public void fatalError(SAXParseException error) {
            error(error);
        }

        public void warning(SAXParseException warn) {
            log.warn("Warning parsing XML: " + file + '(' + warn.getLineNumber() + ") " + warn.getMessage());
        }
    }

    private XMLHelper() { //cannot be instantiated
    }

    public static Document parseFile(String fileName)
            throws IOException, SAXException, ParserConfigurationException {
        return parseInputSource(new InputSource(fileName));
    }

    public static Document parseInputSource(InputSource source)
            throws IOException, SAXException, ParserConfigurationException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setValidating(true);
        //factory.setIgnoringComments(true);
        DocumentBuilder builder = factory.newDocumentBuilder();
        builder.setEntityResolver(DTD_RESOLVER);
        final String file = (source.getSystemId() == null) ? "unknown system id" : source.getSystemId();
        log.info("Parsing XML: " + file);
        builder.setErrorHandler(new ErrorHandler() {
            public void error(SAXParseException error) {
                log.error("Error parsing XML: " + file + '(' + error.getLineNumber() + ')', error);
            }

            public void fatalError(SAXParseException error) {
                error(error);
            }

            public void warning(SAXParseException error) {
                log.warn("Warning parsing XML: " + file + '(' + error.getLineNumber() + ')', error);
            }
        });
        return builder.parse(source).getDocumentElement().getOwnerDocument();
    }

    public static Document parseString(String xml)
            throws IOException, SAXException, ParserConfigurationException {
        return parseInputSource(new InputSource(new ByteArrayInputStream(xml.getBytes())));
    }

    public static org.dom4j.Document parse(String xmlFile)
            throws org.dom4j.DocumentException {
        org.dom4j.Document document = null;
        SAXReader reader = new SAXReader(DOMDocumentFactory.getInstance());
        document = reader.read(xmlFile);
        return document;
    }

    private static org.dom4j.Document parseSAX(String url)
            throws Exception {
        SAXReader saxReader = new SAXReader();
        org.dom4j.Document document = saxReader.read(url);
        log.info("Parsed to DOM4J tree using SAX: " + document);
        // now lets make a DOM object
        DOMWriter domWriter = new DOMWriter();
        org.w3c.dom.Document domDocument = domWriter.write(document);
        // now lets read it back as a DOM4J object
        DOMReader domReader = new DOMReader();
        document = domReader.read(domDocument);
        log.info("Converted to DOM4J tree using DOM: " + document);
        // now lets write it back as SAX events to
        // a SAX ContentHandler which should build up a new document
        SAXContentHandler contentHandler = new SAXContentHandler();
        SAXWriter saxWriter = new SAXWriter(contentHandler, null, contentHandler);
        saxWriter.write(document);
        document = contentHandler.getDocument();
        log.info("Converted DOM4J to SAX events then back to DOM4J: " + document);
        return document;
    }

    public static org.dom4j.Document parseDOM(String url)
            throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        log.info("Loading document with JAXP builder: " + builder);
        org.w3c.dom.Document domDocument = builder.parse(url);
        log.info("Created W3C DOM document: " + domDocument);
        // now convert to DOM4J model
        DOMReader reader = new DOMReader();
        org.dom4j.Document document = reader.read(domDocument);
        log.info("Created DOM4J document: " + document);
        return document;
    }
}
