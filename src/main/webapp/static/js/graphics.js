/*
JavaScriptGraphics v 0.6
Pixel graphics in Javascript.
Copyright (C) 2003 Kitya Karlson http://www.karlson.ru/, karlson@karlson.ru
Tested in Microsoft Internet Explorer 6 and Mozilla 1.3.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation in version 2 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/*! \mainpage JavaScriptGraphics
 *
 * \section intro Introduction
 * <p>Color image is just a 2D array of colors. If you think about image this way you can see
 * that it is possible to draw an image of the size N*M in HTML-only way - as a table with
 * N columns and M rows, where each cell takes one pixel and has a background color assigned
 * to it. Unfortunately even a small image represented like this in HTML results in a large
 * and complex code for the browser. But for artifitial images it is very easy to use RLE
 * compression - if there are several cells in a line of the same color you can
 * replace them by one cell with the correct colspan/rowspan attributes assigned for it.
 * <p>There are three cool things about this type of images:
 * <ol>
 * <li>They can be posted on the pages where images are not allowed (like some forums, or
 * livejournal),
 * <li>The size of HTML sended from the web server to client's computer is not very large -
 * the HTML for the images is generated on the client's computer only,
 * <li>They can be animated to react on user input.
 * </ol>
 * <p>I made a simple JavaScript library that allows you to use simple 2D graphics functions
 * to create such images (like drawing lines, points or circles). Comments and suggestions are <a href="mailto:karlson@karlson.ru">welcome</a>!
 * <p>As an alternative output method a handling of output to a Java applet is also provided in
 * addition to a plain HTML rendering.
 * <p>This library was tested in Microsoft Internet Explorer 6 and Mozilla 1.3.
 * 
 * \section examples Examples
 * <ul>
 * <li><a href="../tests/clock.html">Analog Clock</a> - shows the difference between different types
 * of HTML rendering
 * <li><a href="../tests/lines.html">Color Sun</a> - shows an example of zooming in HTML output (Java output zooming is working in the same way).
 * <li><a href="../tests/eyes.html">Eyes</a> - eyes that follow your mouse pointer.
 * <li><a href="../tests/ontop.html">On Top</a> - DHTML output overlay example.
 * <li><a href="../tests/plot.html">Sin/Cos Plot</a> - shows an example of HTML rendering and Java Applet processing (works only in Mozilla or in IE with Java virtual machine from SUN).
 * </ul>
 *
 * \section conv Converter
 * <a href="../tests/makeimage.php">Image to HTML converter</a> - this converter contains a preprocessing step, which is made using PHP and GD. Color dithering is produce to reduce the output complexity.
 * 
 * \section changes Changes
 * <p><b>v 0.6</b>
 * <ul>
 * <li>Image to HTML image converter added.
 * </ul>
 * <p><b>v 0.5</b>
 * <ul>
 * <li>Polygon and polyline drawing functions are added.
 * <li>DHTML output option and overlay output options + invisible color are added to HTML output processor.
 * <li>New example ("On Top") demonstrating new DHTML output options is added.
 * </ul>
 * <p><b>v 0.4</b>
 * <ul>
 * <li>Java Applet output methods are introduced in addition to HTML output methods.
 * <li>Color values are now accepted in several formats.
 * <li>Rendering time is calculated now.
 * <li>Examples are updated to reflect new features.
 * <li>A lot of bugfixes.
 * </ul>
 * <p><b>v 0.3</b>
 * <ul>
 * <li>Small bugfixes.
 * <li>HTML output processor is moved to the separate class.
 * <li>An optimised method of output compression - Optimised RLE - is introduced. It is using
 * both colspan and rowspan attributes, dividing the table into the minimum number of cells.
 * It is not so fast as the fast simple RLE, but it makes the tables really small. Which method
 * is used for compression (Fast RLE or Optimised RLE) is controlled by the compression
 * parametr of the HTML output class.
 * </ul>
 * <p><b>v 0.2</b>
 * <ul>
 * <li>Functions are rewritten as a class and moved to the separate file.
 * <li>Area fill function is rewritten using stack instead of recursion - this allows large closed areas to be filled-in.
 * <li>Code is cleaned up and documented using Doxygen.
 * </ul>
 * <p><b>v 0.1</b>
 * <ul>
 * <li>Initial release.
 * </ul>
 *
 * \section downloads Downloads
 * <ul>
 * <li>Download <a href="../jsgraphics.0.6.zip">JavaScriptGraphics v 0.6</a> - latest.
 * <li>Download <a href="../jsgraphics.0.5.zip">JavaScriptGraphics v 0.5</a>.
 * <li>Download <a href="../jsgraphics.0.4.zip">JavaScriptGraphics v 0.4</a>.
 * <li>Download <a href="../jsgraphics.0.3.zip">JavaScriptGraphics v 0.3</a>.
 * <li>Download <a href="../jsgraphics.0.2.zip">JavaScriptGraphics v 0.2</a>.
 * <li>Download <a href="../jsgraphics.0.1.zip">JavaScriptGraphics v 0.1</a>.
 * </ul>
 *
 * \section legal Legal
 * <p>This is <b>JavaScriptGraphics</b> library written in 2003 by Kitya Karlson <a href="mailto:karlson@karlson.ru">karlson@karlson.ru</a>.
 * This software is distributed under <a href="http://www.gnu.org/licenses/lgpl.html">LGPL</a>.
 *
 * \section warning Warning
 * <p>After working on this project for a couple of weeks I have found out that <a href="http://www.walterzorn.com/jsgraphics/jsgraphics_e.htm">a simillar
 * attempt</a> was made before already. The main differnce with my approach and the approach
 * taken by Walter Zorn is that my method performs drawing on offscreen first (on array)
 * and then creates optimised html only when flushed. Also in my method three types of
 * output are supported (HTML table, DHTML and Java Applet) and not only one output method like
 * in Walter's class. So my method would work faster and provide better output for more complex
 * images and is more suitable for animation, however Walter's method works faster if you
 * are in need of just one line.
 *
 */

/**
 * @file
 * JavaScriptGraphics is a library for producing graphics using JavaScript
 * by manipulating HTML tables. It uses 'run length encoding' by taking
 * advantage of colspan attributes in order to reduce the complexity of
 * the output. Images created in this manner can be posted on the pages
 * such as forums or LiveJournal where images are not allowed, and can
 * be animated using JavaScript. 
 * The methods provided allow to draw lines, point, circles, ellipsoids and other
 * geometrical figures.
 */

/**
 * JSColor class provides functions for converting different color repersentations
 * (HTML, RGB, INT) into each other. All methods of this class could be used as "static".
 *
 * Examples:
 *
 * HTML: #000000 - black, #FFFFFF - white,
 *
 * RGB: 0,0,0 - black, 255,255,255 - white,
 *
 * INT: 0 - black, 16777215 - white.
 *
 * @ctor
 * Constructs JSColor class (empty).
 */
function JSColor() {
};

/**
 * Converts RGB color to HTML color.
 * @tparam Integer red Red component of the color.
 * @tparam Integer green Green component of the color.
 * @tparam Integer blue Blue component of the color.
 * @treturn String HTML color.
 */
JSColor.prototype.rgbtohtml = function (red,green,blue) {
	x='0123456789ABCDEF';
	return "#" + x.charAt(red >> 4)+x.charAt(red & 15) + x.charAt(green >> 4)+x.charAt(green & 15) + x.charAt(blue >> 4) + x.charAt(blue & 15);
};

/**
 * Converts INT color to HTML color.
 * @tparam Integer rgb Color value.
 * @treturn String HTML color.
 */
JSColor.prototype.inttohtml = function(rgb) {
	return this.rgbtohtml( ((rgb >> 16) & 0xff), ((rgb >> 8) & 0xff ), (rgb & 0xff) );
};

/**
 * Converts HTML color to INT color.
 * @tparam String html HTML color.
 * @treturn Integer Color value.
 */
JSColor.prototype.htmltoint = function(html) {
	x='0123456789ABCDEF';
	html = html.toUpperCase();
	red = 16*x.indexOf(html.charAt(1))+x.indexOf(html.charAt(2));
	green = 16*x.indexOf(html.charAt(3))+x.indexOf(html.charAt(4));
	blue = 16*x.indexOf(html.charAt(5))+x.indexOf(html.charAt(6));
	return (red << 16) | (green << 8) | blue;
};

/**
 * Converts RGB color to INT color.
 * @tparam Integer red Red component of the color.
 * @tparam Integer green Green component of the color.
 * @tparam Integer blue Blue component of the color.
 * @treturn Integer Color value.
 */
JSColor.prototype.rgbtoint = function(red,green,blue) {
	return (red << 16) | (green << 8) | blue;
};

/**
 * "Static" Color object.
 * @type JSColor
 */
var Color = new JSColor();

/**
 * Simple 2D graphics canvas.
 *
 * x=0,y=0 - top left corner of the canvas.
 * x=width-1,y=height-1 - bottom right corner of the canvas.
 *
 * @ctor
 * Constructs a 2D image drawing canvas.
 * @tparam Integer width The width of the canvas.
 * @tparam Integer height The height of the canvas.
 * @tparam Integer bgcolor The background color of the canvas.
 */
function GCanvas(width, height, bgcolor) {

/**
 * The width of the canvas.
 * @type Integer
 */
 this.width=((width>0)?width:0) || 35;

/**
 * The height of the canvas.
 * @type Integer
 */
 this.height=((height>0)?height:0) || 35;

/**
 * The background color of the canvas (HTML format string).
 * @type String
 */
 this.bgcolor=bgcolor || 0;

/**
 * Internal array representing the image canvas.
 * @type Array
 */
 this.image = new Array(this.height*this.width);
 for (i=0;i<this.height*this.width;i++) {
	this.image[i]=this.bgcolor;
 }
};


/**
 * Clears the whole canvas using default background color.
 */
GCanvas.prototype.clear = function() {
 for (i=0; i < this.height*this.width; i++) {
    this.image[i]=this.bgcolor;
 }
};

/**
 * Puts a pixel of the defined color in the position x,y.
 * @tparam Integer x X coordinate of the pixel.
 * @tparam Integer y Y coordinate of the pixel.
 * @tparam Integer color The color of the pixel.
 */
GCanvas.prototype.draw = function(x,y,color) {
 if ((x >= 0) && (y >= 0) && (y < this.height) && (x < this.width)) {
 	this.image[y*this.width+x]=color;
 }
};

/**
 * Gets a color of a pixel in the position x,y 
 * @treturn Integer Color of the pixel.
 */
GCanvas.prototype.getcolor = function(x,y) {
 if ((x >= 0) && (y >= 0) && (y < this.height) && (x < this.width)) {
 	return this.image[y*this.width+x];
 } else {
	return null;
 }
};

/**
 * Draws a line (Bresenham's algorithm).
 * @tparam Integer x1 X coordinate of the start pixel.
 * @tparam Integer y1 Y coordinate of the start pixel.
 * @tparam Integer x2 X coordinate of the ending pixel.
 * @tparam Integer y2 Y coordinate of the ending pixel.
 * @tparam Integer color The color of the line.
 */
GCanvas.prototype.line = function(x1, y1, x2, y2, color)
{
 var pX=(x1<x2) ? 1 : -1;
 var pY=(y1<y2) ? 1 : -1;

 var E;
 var Delta1;
 var Delta2;

 var X=x1;
 var Y=y1;
 var I=1;
 var temp;

 if (x1>x2) { temp = x1; x1=x2; x2=temp; }
 if (y1>y2) { temp = y1; y1=y2; y2=temp; }

 var dX=x2-x1;
 var dY=y2-y1;

 this.draw(X, Y, color);

 if (dX>=dY)
    {
     Delta1=dY<<1;
     Delta2=(dY-dX)<<1;
     E=Delta1-dX;

     for (X+=pX; I<=dX; I++, X+=pX)
         {

          if (E>0)
             {
              E+=Delta2;
              Y+=pY;
             }
          else E+=Delta1;

          this.draw(X, Y, color);
         }
    }
 else
    {
     Delta1=dX<<1;
     Delta2=(dX-dY)<<1;
     E=Delta1-dY;

     for (Y+=pY; I<=dY; I++, Y+=pY)
         {

          if (E>0)
             {
              E+=Delta2;
              X+=pX;
             }
          else E+=Delta1;

          this.draw(X,Y,color);
         }
    }
};

/**
 * Draws a circle (Bresenham's algorithm).
 * @tparam Integer xc X coordinate of the center of the circle.
 * @tparam Integer yc Y coordinate of the center of the circle.
 * @tparam Integer r The radius of the circle.
 * @tparam Integer color The color of the circle.
 */
GCanvas.prototype.circle = function(xc,yc,r,color) {
  var y = r;
  var x = 0;
  var d = 3 - 2*r;
  while (x <= y) {
     this.draw(x+xc,y+yc,color);
     this.draw(x+xc,-y+yc,color);
     this.draw(-x+xc,-y+yc,color);
     this.draw(-x+xc,y+yc,color);
     this.draw(y+xc,x+yc,color);
     this.draw(y+xc,-x+yc,color);
     this.draw(-y+xc,-x+yc,color);
     this.draw(-y+xc,x+yc,color);
     if (d < 0) {
	d = d + 4*x +6;
     } else {
	d = d + 4*(x-y) + 10;
        y = y-1;
     }
     x = x+1;
 }
};

/**
 * Draws an ellipse (Bresenham's algorithm).
 * @tparam Integer xc X coordinate of the center of the circle.
 * @tparam Integer yc Y coordinate of the center of the circle.
 * @tparam Integer a The semi-axis of the ellipse.
 * @tparam Integer b The semi-axis of the ellipse.
 * @tparam Integer color The color of the ellipse.
 */
GCanvas.prototype.ellipse = function(xc,yc,a,b,color)
{
  b_square=b*b; 
  a_square=a*a; 
  row=b; 
  col=0; 
  two_a_square=a_square<<1; 
  four_a_square=a_square<<2; 
  four_b_square=b_square<<2; 
  two_b_square=b_square<<1; 
  d=two_a_square*((row-1)*(row))+a_square+two_b_square*(1-a_square); 
  while(a_square*(row)>b_square*(col))
  {
   this.draw(col+xc, row+yc, color); 
   this.draw(col+xc, yc-row, color); 
   this.draw(xc-col, row+yc, color); 
   this.draw(xc-col, yc-row, color); 
   if (d>=0)
   {
    row--; 
    d-=four_a_square*(row); 
   }
   d+=two_b_square*(3+(col<<1)); 
   col++; 
  }
  d=two_b_square*(col+1)*col+two_a_square*(row*(row-2)+1)+(1-two_a_square)*b_square; 
  while ((row) + 1)
  {
   this.draw(col+xc, row+yc, color); 
   this.draw(col+xc, yc-row, color); 
   this.draw(xc-col, row+yc, color); 
   this.draw(xc-col, yc-row, color); 
   if (d<=0)
   {
    col++; 
    d+=four_b_square*col; 
   }
   row--; 
   d+=two_a_square*(3-(row <<1)); 
  }
};

/**
 * Fills a closed area (using stack)
 * @tparam Integer x X coordinate of the point inside the area to be filled-in.
 * @tparam Integer y Y coordinate of the point inside the area to be filled-in.
 * @tparam Integer color Fill color.
 */
GCanvas.prototype.fill = function(x,y,color) {
    stack_head=0;
    stack_tail=0;
    floodfill_stackx = new Array((this.width+2)*(this.height+2));
    floodfill_stacky = new Array((this.width+2)*(this.height+2));

    clr=this.getcolor(x,y);
    floodfill_stackx[stack_head]=x;
    floodfill_stacky[stack_head]=y;
    this.draw(x,y,color);
    stack_head++;

    while ( (stack_head<((this.width+2)*(this.height+2))) && (stack_head>stack_tail) ) {
        x=floodfill_stackx[stack_tail];
        y=floodfill_stacky[stack_tail];
        stack_tail++;
        if (x>=0 && y>=0 && x<this.width && y<this.height) {
	    if (this.getcolor(x+1,y)==clr) {
                floodfill_stackx[stack_head]=x+1;
            	floodfill_stacky[stack_head]=y;
                this.draw(x+1,y,color);
            	stack_head++;
            }
            if (this.getcolor(x-1,y)==clr) {
                floodfill_stackx[stack_head]=x-1;
    	        floodfill_stacky[stack_head]=y;
                this.draw(x-1,y,color);
            	stack_head++;
                }
            if (this.getcolor(x,y+1)==clr) {
                floodfill_stackx[stack_head]=x;
                floodfill_stacky[stack_head]=y+1;
                this.draw(x,y+1,color);
            	stack_head++;
                }
            if (this.getcolor(x,y-1)==clr) {
                floodfill_stackx[stack_head]=x;
                floodfill_stacky[stack_head]=y-1;
                this.draw(x,y-1,color);
            	stack_head++;
                }
            }
        }
    delete floodfill_stacky;
    delete floodfill_stackx;
};

/**
 * Draws a polyline.
 * @tparam Array x x1,x2, ..., xn.
 * @tparam Array y y1,y2, ..., yn.
 * @tparam Integer color Polyline color.
 */
GCanvas.prototype.polyline = function(x, y, color) {
    var z = x.length-1; while (z >= 0) this.line(x[z], y[z], x[--z], y[z], color);
};

/**
 * Draws a polygon (automatically closed if last points are not identical.
 * @tparam Array x x1,x2, ..., xn.
 * @tparam Array y y1,y2, ..., yn.
 * @tparam Integer color Polygon color.
 */
GCanvas.prototype.polygon = function(x, y, color) {
    this.polyline(x, y, color);
    this.line(x[x.length-1], y[x.length-1], x[0], y[0], color);
};

/**
 * Output processor.
 *
 * An abstract output processor.
 *
 * @ctor
 * Abstract output processor.
 * @tparam Integer scale The scaling of the output (1 = 1x = no scaling).
 */
function GOutput(scale) {
/**
 * Scaling of the output (1 = 1x = no scaling).
 * @type Integer
 */
 this.scale=scale || 1;
}

/**
 * HTML output processor.
 *
 * This output processor can be used to render the canvas as an HTML table.
 * Two types ('Fast RLE' and 'Optimised RLE') of output rendering are provided,
 * see bellow.
 *
 * @ctor
 * Constructs an HTML output processor.
 */
function GHTMLOutput() {
/**
 * Compression parametr (0 - fast RLE, 1 - optimised RLE).
 * @type Integer
 */
 this.compression=0;
/**
 * Output type - HTML (table) or DHTML (div's). If dhtml is set to false HTML output
 * is produced and if dhtml is set to true DHTML output is produced.
 * @type Boolean
 */
 this.dhtml = true;
/**
 * An invsibile color. By default invisible_color = -1, i.e. the default background of the canvas.
 * @type Integer
 */
 this.invisible_color = -1;

/**
 * Number of cells generated in the HTML table.
 * @type Integer
 */
 this.number_of_cells=0;
/**
 * Time (in ms.) used for the generation of the HTML table.
 * @type Integer
 */
 this.generation_time=0;
/**
 * Javascript document object (usually this.document).
 * 
 * Needed only for print functions.
 * @type Object
 */

 this.doc = null;
/**
 * Output layer ID.
 *
 * Needed only for print functions.
 * @type String
 */
 this.layerId = null;
/**
 * Append or overwrite the layer.
 *
 * Needed only for print functions.
 * @type Boolean
 */
 this.append = false;
}
GHTMLOutput.prototype = new GOutput();

/**
 * HTML output printing parametrs setup function.
 * 
 * @tparam Object doc Document object (usually this.document).
 * @tparam String layerId Output layer ID.
 */
GHTMLOutput.prototype.setup = function(doc,layerId) {
 this.doc=doc;
 this.layerId=layerId;
};

/**
 * Returns the image canvas html (using RLE compression on lines = fast RLE).
 * @treturn String A table in HTML format representing the image canvas.
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GHTMLOutput.prototype.get_html = function(gcanvas) {
  time_now = new Date();
  this.number_of_cells = 0;
  if (this.invisible_color == -1) {
	inv_color = gcanvas.bgcolor;
  } else {
	inv_color = this.invisibile_color;
  }
  str = new String("");
  len = 0;
  if (! this.dhtml) {
  	str += "<table border=0 cellspacing=0 cellpadding=0 width="+gcanvas.width*this.scale+" height="+gcanvas.height*this.scale+">"; 
  }
  for (i=0; i < gcanvas.height; i++) {
   if (! this.dhtml) {
   	str += "<tr height="+this.scale+" width="+gcanvas.width*this.scale+">";
   }
   current_color = gcanvas.getcolor(0,i);
   len = 0;
   start_j = 0;
   for (j=0; j < gcanvas.width; j++) {
    if ( (gcanvas.getcolor(j,i) != current_color) || (j == gcanvas.width-1)) {
     if (j== gcanvas.width-1) { len++; }
     if (! this.dhtml) {
     	str += "<td width="+this.scale*len+" height="+this.scale + ( (len>1) ? " colspan="+len : "" ) + ( (current_color!=inv_color) ? " bgcolor="+Color.inttohtml(current_color) : "") + "></td>";
     } else {
        if (current_color!=inv_color) {
		str += '<div style="position:absolute;'+ 'left:' + (start_j*this.scale) + 'px;'+ 'top:' + (i*this.scale) + 'px;'+ 'width:' + (this.scale*len) + 'px;'+ 'height:' + this.scale + 'px;'+ 'clip:rect(0,'+(this.scale*len)+'px,'+this.scale+'px,0);' + 'overflow:hidden;background-color:' + Color.inttohtml(current_color) + ';' + '"><\/div>';
	}
     }
     this.number_of_cells++;
     len=1;
     start_j = j;
     current_color=gcanvas.getcolor(j,i);
    } else {
     len++;
    }
   }
   if (! this.dhtml) {
        str += "</tr>";
   }
  }
  if (! this.dhtml) {
       str += "</table>";
  }
  time_finish = new Date();
  this.generation_time = time_finish - time_now;
  delete time_now;
  delete time_finish;
  return str;
};


/**
 * Returns the image canvas html (using RLE compression on both lines and rows = optimised RLE).
 * @treturn String A table in HTML format representing the image canvas.
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GHTMLOutput.prototype.get_optimised_html = function(gcanvas) {

  time_now = new Date();
  if (this.invisible_color == -1) {
	inv_color = gcanvas.bgcolor;
  } else {
	inv_color = this.invisibile_color;
  }
  this.number_of_cells = 0;
  str = new String("");
  flushed = new Array(gcanvas.height*gcanvas.width);
  for (i=0;i<gcanvas.height*gcanvas.width;i++) {	
	flushed[i]=0;
  }
  if (! this.dhtml) {
  	str += "<table border=0 cellspacing=0 cellpadding=0 width="+gcanvas.width*this.scale+" height="+gcanvas.height*this.scale+">"; 
  }
  for (i=0; i < gcanvas.height; i++) {
   if (! this.dhtml) {
	   str += "<tr height="+this.scale+" width="+gcanvas.width*this.scale+">";
   }
   for (j=0; j < gcanvas.width; j++) {
	if (flushed[i*gcanvas.width+j] == 0) {
	    current_color = gcanvas.getcolor(j,i);
	    k=gcanvas.height;
	    opt = 0;
	    colspan = 1;
	    rowspan = 1;
	    for (x=j; x < gcanvas.width; x++) {
		if (flushed[i*gcanvas.height+x]==1) { break; }
		if (gcanvas.getcolor(x,i) != current_color) { break; }
		for (y=i; y < k; y++) {
			if (flushed[y*gcanvas.width+x]==1) { break; }
			if (gcanvas.getcolor(x,y) != current_color) { break; }
	 	}
		if (y-1<0) { break; }
		if (gcanvas.getcolor(x,y-1) != current_color) { break; }
		k=y;
		if ( ((x-j+1)*(y-i)) > opt) {
			opt=(x-j+1)*(y-i);
			colspan = x-j+1;
			rowspan = y-i; 
		}
	   }
	   for (y=i; y < i+rowspan; y++) {
		for (x=j; x < j+colspan; x++) {
			flushed[y*gcanvas.width+x]=1;
		}
	   }
	   if (! this.dhtml) {
	   	str += "<td width="+this.scale*colspan+" height="+ this.scale*rowspan + ( (colspan>1) ? " colspan="+colspan : "" ) + ( (rowspan > 1) ? " rowspan=" + rowspan : "") + ( (current_color!=inv_color) ? " bgcolor="+Color.inttohtml(current_color) : "") + "></td>";
	   } else {
	        if (current_color!=inv_color) {
			str += '<div style="position:absolute;'+ 'left:' + (j*this.scale) + 'px;'+ 'top:' + (i*this.scale) + 'px;'+ 'width:' + (this.scale*colspan) + 'px;'+ 'height:' + (this.scale*rowspan) + 'px;'+ 'clip:rect(0,'+(this.scale*colspan)+'px,'+(this.scale*rowspan)+'px,0);' + 'overflow:hidden;background-color:' + Color.inttohtml(current_color) + ';' + '"><\/div>';
		}
	   }
	   this.number_of_cells++;
	}
   }
   if (! this.dhtml) {
   	str += "</tr>";
   }
  }
  if (! this.dhtml) {
  	str += "</table>";
  }
  delete flushed;
  time_finish = new Date();
  this.generation_time = time_finish - time_now;
  delete time_now;
  delete time_finish;
  return str;	
};


/**
 * Assigns the image canvas html (using RLE compression on lines = fast RLE) to a given layer.
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GHTMLOutput.prototype.print_html = function(gcanvas) {
      if ((this.doc != null) && (this.layerId != null)) {
	      if (this.doc.all) {
        	outlayer = this.doc.all[this.layerId];
	      }
	      if (this.doc.getElementById) {
        	outlayer = this.doc.getElementById(this.layerId);
	      }
	      if (this.append) {
      		      outlayer.innerHTML += this.get_html(gcanvas);
	      } else {
	      	      outlayer.innerHTML = this.get_html(gcanvas);
	      }
     }
};

/**
 * Assigns the image canvas html (using RLE compression on both lines and rows = optimised RLE) to a given layer.
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GHTMLOutput.prototype.print_optimised_html = function(gcanvas) {
      if ((this.doc != null) && (this.layerId != null)) {
	      if (this.doc.all) {
        	outlayer = this.doc.all[this.layerId];
	      }
	      if (this.doc.getElementById) {
        	outlayer = this.doc.getElementById(this.layerId);
	      }
	      if (this.append) {
	      	      outlayer.innerHTML += this.get_optimised_html(gcanvas);
	      } else {
	      	      outlayer.innerHTML = this.get_optimised_html(gcanvas);
	      }
     }
};

/**
 * Returns the image canvas html
 * @treturn String A table in HTML format representing the image canvas.
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GHTMLOutput.prototype.get = function(gcanvas) {
	switch (this.compression) {
		case 0: return this.get_html(gcanvas); break;
		case 1: return this.get_optimised_html(gcanvas); break;
		default: return this.get_html(gcanvas); break;
	}
};

/**
 * Assigns the image canvas html to a given layer.
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GHTMLOutput.prototype.print = function(gcanvas) {
	switch (this.compression) {
		case 0: return this.print_html(gcanvas); break;
		case 1: return this.print_optimised_html(gcanvas); break;
		default: return this.print_html(gcanvas); break;
	}
}

/**
 * Java (applet) output processor.
 *
 * This output processor can be used to pass your canvas to a Java applet for rendering.
 *
 * @ctor
 * Constructs an applet output processor.
 */
function GJavaOutput() {
/**
 * Time (in ms.) used for the generation of the image string to be passed to the applet.
 * @type Integer
 */
 this.generation_time=0;

/**
 * Javascript document object (usually this.document).
 * 
 * Needed only for print function.
 * @type Object
 */
 this.doc = null;

/**
 * The name of an applet providing setImage function.
 *
 * Example of an applet providing setImage function:
 * <PRE>
 * -----------------------------------------------------------
 * 
 * import java.applet.Applet;
 * import java.awt.Graphics;
 * import java.awt.Image;
 * import java.awt.Component;
 * import java.lang.Integer;
 * import java.util.StringTokenizer;
 * 
 * public class ImageOutput extends Applet {
 *    Image JSImage = null;
 * 
 *    public void init() {
 * 	// some initialisation here
 *    }
 * 
 *    public void paint(Graphics g) {
 *    	if (this.JSImage != null) {
 * 	    g.drawImage(this.JSImage, 0, 0, this);
 * 	}
 *    }
 * 
 *    public void setImage(int w, int h, String pixels) {
 * 	int pix[] = new int[w * h];
 * 	StringTokenizer st = new StringTokenizer(pixels," ");
 * 	int index = 0;
 *      	while (st.hasMoreTokens()) {
 *          		pix[index++]=Integer.parseInt(st.nextToken());
 *      	}
 *       	this.JSImage = createImage(new java.awt.image.MemoryImageSource(w, h, pix, 0, w));
 * 	repaint();
 *    }
 * }
 * 
 * -----------------------------------------------------------
 * </PRE>
 * Javascript is used to passed a String of the image bytes separated by space. Array would
 * be a better choice, but it seems that MS IE fails to pass JavaScript Array to Java correctly.
 *
 * Needed only for print function.
 * @type String
 */
 this.appletName = null;

/**
 * Alpha chanel value.
 * @type Integer
 */
 this.alpha = 255;
}
GJavaOutput.prototype = new GOutput();

/**
 * Java output printing parametrs setup function (needed only for print functions).
 * 
 * @tparam Object doc Document object (usually this.document).
 * @tparam String appletName Reciving java applet name.
 */
GJavaOutput.prototype.setup = function(doc,appletName) {
 this.doc=doc;
 this.appletName=appletName;
};

/**
 * Returns the image canvas string to be passed to Java.
 * @treturn String String representing the bytes of the image separated by spaces;
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GJavaOutput.prototype.get = function(gcanvas) {
  time_now = new Date();
  pixels = new String("");
	for (y=0;y<gcanvas.height;y++) {
		for (i=0;i<this.scale;i++) {
			for (x=0;x<gcanvas.width;x++) {
				for (j=0;j<this.scale;j++) {
					pixels += (pixels.length>0?" ":"") + ((this.alpha << 24) | gcanvas.getcolor(x,y));
				}
			}
		}
	}
  time_finish = new Date();
  this.generation_time = time_finish - time_now;
  delete time_now;
  delete time_finish;
  return pixels;
};

/**
 * Passes the image canvas String to a given applet.
 * @tparam GCanvas gcanvas 2D image canvas.
 */
GJavaOutput.prototype.print = function(gcanvas) {
      if ((this.doc != null) && (this.appletName != null)) {
		this.doc.applets[this.appletName].setImage(gcanvas.width*this.scale,gcanvas.height*this.scale,this.get(gcanvas));
       }
};