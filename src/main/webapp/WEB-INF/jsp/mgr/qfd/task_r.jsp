<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function() {
        $(".side").sidecontent({
                    classmodifier: "sidecontent",
                    attachto: "rightside",
                    width: "400px",
                    opacity: "0.8",
                    pulloutpadding: "5",
                    textdirection: "vertical",
                    clickawayclose: true
                });
        $("#breadcrumb").jBreadCrumb();
    });
</script>
<quicktips>
    <div class="side" title="相关提示">
        <div style="margin:10px 10px 20px 10px;overflow: auto;height:500px;">
            <img src="${pageContext.request.contextPath}/static/images/qfd-house-of-quality.jpg" alt="">

            <h1>QFD (Quality Function Deployment)</h1>

            <p><strong>Quality Function Deployment (QFD)</strong> is a method of product development where the product or process is directed from the <strong>Voice
                of the Customer (VOC)</strong> through development of requirements, specifications design feature development, process selection and process
                control.</p>

            <p>The QFD process utilizes a series of matrices which are linked as the product/service development process progresses. This cascade of customer
                wants into requirements and eventually process controls is accomplished by evaluating each level by walking through rooms which have specific
                functions. These rooms are carefully entered and exited by a team of Subject Matter Experts (SME) with relationships, rankings and expected
                measures and metrics. The rooms are situated in such a way that the method has been given the name the <strong>House of Quality.</strong></p>
        </div>
    </div>
    <div class="side" title="获取帮助">
        <div style="margin:10px 10px 20px 10px;overflow: auto;height:500px;">
            <h2>House of Quality</h2>
            <img src="${pageContext.request.contextPath}/static/images/QFD-House.jpg" title="QFD House of Quality" alt="QFD House of Quality"
                 style="width: 300px;">

            <p>The first matrix of the QFD process typically takes the very non technical Voice of the Customer (VOC), scientifically ranks the importance of
                these
                wants, needs and desires and links technical "How To's" to the wants, needs, and desires. Each "How To" is translated or cascaded into Measures
                and
                Metrics for measuring success.</p>

            <p>Each room’s function is similar to the rooms of the typical home. The kitchen, the living room, the bedroom, each have unique functions just like
                the
                "House of Quality" QFD level 1. QFD level 1 also provides the opportunity to do benchmarking of current products against the measures and
                metrics.
                QFD level 1 also considers how each "technical how" might effect each other. This correlation section is often called the roof section because
                it is
                on top of the matrix and is angled like a roof.</p>

            <p>When completed, requirements are written, benchmarking features are established to study further, and competing specifications are ranked to
                balance
                the delivery of a design based on the impact on the customer.</p>
        </div>
    </div>
    <div class="side" title="展开讨论">
        <div style="margin:10px 10px 20px 10px;overflow: auto;height:500px;">
            <h1>Six Sigma Strategy</h1>

            <p><strong>Six Sigma</strong> is a term coined by Motorola that emphasizes the improvement of processes for the purpose of reducing variability and
                making general improvements. It is a meshing of several quality tools into a total quality methodology. When used properly, Six Sigma can
                provide
                amazing results to any company's bottom line.</p>
            <img src="${pageContext.request.contextPath}/static//images/dmaic.gif" alt="DMAIC" title="DMAIC" style="width: 209px; height: 209px;">

            <h2 style="font-size: 0.8em; color: rgb(102, 102, 102); text-align: center; padding-top: 5px;">DMAIC</h2>

            <p>Six Sigma is a rigorous methodology that focuses on consistently developing and delivering virtually perfect products and services. Six Sigma is
                also
                a management strategy in which statistical tools are used to achieve greater profitability and breakthrough gains in quality. Six Sigma has been
                referred to as Total Quality Management (TQM) on steroids.</p>

            <p>Six Sigma is beneficial by driving data driven decisions instead of "by the seat of the pants" decision making. It has been shown to improve a
                company’s overall competitive advantage. Motorola, GE, and Allied Signal have all been tied to Six Sigma methodology with substantial benefits
                being
                gained as a result. Companies like Bank of America and Caterpillar are continuing the tradition of Six Sigma strategic deployment.</p>

            <p>For every success story there are many less than acceptable deployments. Six Sigma has been incorrectly used as justification for personnel
                reduction, and for taking directions where the data was not clearly and concisely supporting the conclusions. Deployment of Six Sigma should be
                both
                strategic and tactical for best results. Governance of the process provides benefits as well, so that over zealous practioners do not read into
                the
                data something that is not there.</p>

            <p>Benefits of Following the Strategic Six Sigma Methodology</p>
            <ul>
                <li>Cost Reductions</li>
                <li>Defect reductions</li>
                <li>Market-share growth</li>
                <li>Product and service improvements</li>

                <li>Culture changes</li>
                <li>Productivity improvements</li>
                <li>Customer relations improvements</li>
                <li>Productivity improvements</li>
            </ul>
        </div>
    </div>
</quicktips>



