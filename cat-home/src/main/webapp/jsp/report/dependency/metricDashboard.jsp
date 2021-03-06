<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="res" uri="http://www.unidal.org/webres"%>
<jsp:useBean id="ctx" type="com.dianping.cat.report.page.dependency.Context" scope="request"/>
<jsp:useBean id="payload" type="com.dianping.cat.report.page.dependency.Payload" scope="request"/>
<jsp:useBean id="model" type="com.dianping.cat.report.page.dependency.Model" scope="request"/>

 <c:choose>
	<c:when test="${payload.fullScreen}">
		<res:bean id="res" />
		<res:useCss value='${res.css.local.table_css}' target="head-css" />
		<res:useJs value="${res.js.local['dependencyConfig.js']}" target="head-js" />
		<res:useCss value='${res.css.local.body_css}' target="head-css" />
		<res:useCss value="${res.css.local['bootstrap.css']}" target="head-css" />
		<res:useJs value="${res.js.local['jquery-1.7.1.js']}" target="head-js" />
		<res:useJs value="${res.js.local['bootstrap.min.js']}" target="head-js" />
		<res:useJs value="${res.js.local['baseGraph.js']}" target="head-js"/>
		<res:useJs value="${res.js.local['highcharts.js']}" target="head-js" />
		<div class="report">
			<div id="fullScreenData">
				<style>
					.ui-tooltip {
						max-width:36555px;
					 }
					.tab-content	table {
					  max-width: 100%;
					  background-color: transparent;
					  border-collapse: collapse;
					  border-spacing: 0; 
					}
				</style>
				<div class="row-fluid">
					<div class="span12">
						<%@ include file="../top/topMetric.jsp"%>
					</div>
				</div>
			</div>
	    </div>
	    <script type="text/javascript">
			$(document).ready(function() {
				var id = '${payload.action.name}';
				var frequency = ${payload.frequency};
				var refresh = ${payload.refresh};
				
				if(refresh){
					$('#refresh${payload.frequency}').addClass('btn-danger');
					setInterval(function(){
						location.reload();				
					},frequency*1000);
				};
			});
		</script>
	</c:when>
	<c:otherwise>
		<a:report title="Dependency Report"
		navUrlPrefix="domain=${model.domain}&op=metricDashboard">
		<jsp:attribute name="subtitle">${w:format(model.reportStart,'yyyy-MM-dd HH:mm:ss')} to ${w:format(model.reportEnd,'yyyy-MM-dd HH:mm:ss')}</jsp:attribute>
		<jsp:body>
		<div class="report">
			<div class="text-center">
		 		<%@ include file="dependencyTimeNavTab1.jsp"%>
			</div>
			<div class="">
				<%@ include file="../top/topMetric.jsp"%>
			</div>
			<style>
			.ui-tooltip {
				max-width:36555px;
			 }
			.tab-content	table {
			  max-width: 100%;
			  background-color: transparent;
			  border-collapse: collapse;
			  border-spacing: 0; 
			}
		</style>
	</jsp:body>
	</a:report>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
$(document).ready(function() {
	$('#minute'+${model.minute}).addClass('disabled');
	$( ".hreftip" ).tooltip({
		show: true,
		delay:{show:10000, hide:100000}, 
		position: {
			my: "left top",
			at: "left bottom"
		},
		content: function() {
		  return $( this ).attr( "title" );
		},
		open: function( event, ui ) {
			ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
		}
	});
	
	$('.position').hide();
	$('.switch').hide();
	$('#Dashboard_report').addClass("open active");
	$('#dashbord_system').addClass("active");
	$('#Dependency_report').removeClass("open active");
});

</script>

