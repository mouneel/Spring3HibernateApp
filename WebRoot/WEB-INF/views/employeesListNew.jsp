<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false" %>
<html>
<head>
	<title>Employee Contact Details - Demo</title>
	
 		<spring:url value="/resources/js/jquery-1.12.3.js"
	var="jqueryJs" />
		<script src="${jqueryJs}"></script>
	<spring:url value="/resources/js/jquery.dataTables.js"
	var="datatable" />
		<script src="${datatable}"></script>
	<spring:url value="/resources/css/jquery.dataTables.css" var="jquerydataTables" />
		<link href="${jquerydataTables}" rel="stylesheet" />
	<spring:url value="/resources/css/jquery.dataTables.min.css" var="jquerydataTablesMin" />
		<link href="${jquerydataTablesMin}" rel="stylesheet" />
	<spring:url value="/resources/css/common.css" var="common" />
		<link href="${common}" rel="stylesheet" /> 
		

		
	<spring:url value="/resources/js/jquery.dataTables.js"
	var="datatable" />
		<script src="${datatable}"></script> 
		
		
		
		

	<spring:url value="/resources/js/jquery.dataTables.min.js"
	var="jquerydatatablesmini" />
		<script src="${jquerydatatablesmini}"></script>		




		
		
		
		
	<spring:url value="/resources/css/buttons.dataTables.min.css" var="buttonsdatatablemini" />
		<link href="${buttonsdatatablemini}" rel="stylesheet" />
	<spring:url value="/resources/js/jquery.dataTables.min.js"
	var="jquerydatatablesmini" />
		<script src="${jquerydatatablesmini}"></script>
	<spring:url value="/resources/js/dataTables.buttons.min.js"
	var="datatablebuttons" />
		<script src="${datatablebuttons}"></script>
	<spring:url value="/resources/js/jszip.min.js"
	var="jszipmin" />
		<script src="${jszipmin}"></script>				
	<spring:url value="/resources/js/pdfmake.min.js"
	var="makepdf" />
		<script src="${makepdf}"></script>
	<spring:url value="/resources/js/vfs_fonts.js"
	var="vfsfonts" />
		<script src="${vfsfonts}"></script>	
	<spring:url value="/resources/js/buttons.html5.min.js"
	var="buttonshtml5" />
		<script src="${buttonshtml5}"></script>
	<spring:url value="/resources/js/buttons.colVis.min.js"
	var="buttonscolVis" />
		<script src="${buttonscolVis}"></script>
		
</head>
<body>

<div>
	<h3 align="center"> Employee Contact Details - Demo</h3>
</div>

<br>

<div id="showmenu"  style="align:Center; height:30px; width:200px; overflow: hidden; color:Red; cursor:pointer">Filter Options</div>
<div class="menu" style="align:Center; height:100px; width:100px; overflow: hidden; overflow-y: scroll">
	<a href="employeePieChart.html">Pie Chart</a>
</div>

<br>

<table id="example" class="display" cellspacing="0" width="100%" style="overflow-x:auto">
				<thead>
					<tr>
						<th>EmpName</th>
						<th>EmpAge</th>
						<th>EmpAddress</th>
						<th>Salary</th>
						<th>Delete</th>
					</tr>
				</thead>
				
				<tfoot>
		            <tr>
		               <th>EmpName</th>
						<th>EmpAge</th>
						<th>EmpAddress</th>
						<th>Salary</th>
						<th>Delete</th>
		            </tr>
		        </tfoot>
			</table>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	
	var data =eval('${employeeList}');
	var table = $('#example').DataTable( {
		  "aaData": data,
		  "aoColumns": [
		    { "mData": "empName"},
		    { "mData": "empAge"},
		    { "mData": "empAddress"},
		    { "mData": "salary"},
		    { "mData": "empId"}
		  ],
		  "paging":true,
		  
		  
			dom: 'Bfrtip',
		    buttons: [
		        {
		            extend: 'copyHtml5',
		            exportOptions: {
		                columns: [ 0, ':visible']
		            }
		        },
		        {
		            extend: 'excelHtml5',
		            exportOptions: {
		                columns: ':visible'
		            }
		        },
		        {
		            extend: 'pdfHtml5',
		            exportOptions: {
		            	columns: [ 0, ':visible']
		            }
		        },
		        {
		            extend: 'csvHtml5',
		            exportOptions: {
		                columns: [ 0, 1, 2, 3 ]
		            }
		        },
		        'colvis'
		    ],
	
	
	
			////////////////////////////////////
			// Delete the Entry in the Table
			///////////////////////////////////		        
		        "columnDefs": [ {
		            "targets": 4,
		            "data": "EmpId",
		            "render": function ( data, type, full, meta ) {
		              return '<a href="employeeDelete.html?empId='+data+'">Delete</a>';
		            }
		          } ]
		  
		  
		});
	
	/////////////////////////////////////
	// Individual Colum Search - Start
	/////////////////////////////////////
	$('#example tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( title+'<input type="text" placeholder="Search '+title+'" />');
    } );
	
	table.columns().every( function () {
        var that = this;
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() != this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
	////////////////////////////////////
	// Individual Colum Search - End
	///////////////////////////////////
	
	
	$('#showmenu').click(function() {
        $('.menu').slideToggle("fast");
	});

	
	
	
	
});


</script>



<%-- 	<spring:url value="/resources/js/buttons.colVis.min.js"
	var="buttonscolVis" />
		<script src="${buttonscolVis}"></script>
		
	<spring:url value="/resources/js/buttons.flash.min.js"
	var="buttonsflash" />
		<script src="${buttonsflash}"></script>
		
	<spring:url value="/resources/js/buttons.html5.min.js"
	var="buttonshtml5" />
		<script src="${buttonshtml5}"></script>

	<spring:url value="/resources/js/buttons.print.min.js"
	var="buttonsprint" />
		<script src="${buttonsprint}"></script>

	<spring:url value="/resources/js/dataTables.buttons.min.js"
	var="datatablebuttons" />
		<script src="${datatablebuttons}"></script>

	<spring:url value="/resources/js/jquery.dataTables.js"
	var="jquerydatatables" />
		<script src="${jquerydatatables}"></script>

	<spring:url value="/resources/js/jquery.dataTables.min.js"
	var="jquerydatatablesmini" />
		<script src="${jquerydatatablesmini}"></script>

	<spring:url value="/resources/js/jquery-1.12.1.min.js"
	var="jquery121min" />
		<script src="${jquery121min}"></script>
		
	<spring:url value="/resources/js/jquery-1.12.3.js"
	var="jquery123" />
		<script src="${jquery123}"></script>

	<spring:url value="/resources/js/jszip.min.js"
	var="jszipmin" />
		<script src="${jszipmin}"></script>

	<spring:url value="/resources/js/pdfmake.min.js"
	var="makepdf" />
		<script src="${makepdf}"></script>

	<spring:url value="/resources/js/vfs_fonts.js"
	var="vfsfonts" />
		<script src="${vfsfonts}"></script>
		
	<spring:url value="/resources/css/buttons.dataTables.min.css" var="buttonsdatatablemini" />
		<link href="${buttonsdatatablemini}" rel="stylesheet" />
		
	<spring:url value="/resources/css/jquery.dataTables.min.css" var="jquerydatatablemini" />
		<link href="${jquerydatatablemini}" rel="stylesheet" /> --%>