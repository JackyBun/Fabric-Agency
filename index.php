<?php
include("../db/connect.php")
?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Admin Panel</title>

	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/datepicker3.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/select2.min.css">
	<link rel="stylesheet" href="css/dataTables.bootstrap.css">
	<link rel="stylesheet" href="css/jquery.fancybox.css">
	<link rel="stylesheet" href="css/AdminLTE.min.css">
	<link rel="stylesheet" href="css/_all-skins.min.css">
	<link rel="stylesheet" href="css/on-off-switch.css" />
	<link rel="stylesheet" href="css/summernote.css">
	<link rel="stylesheet" href="style.css">

</head>

<?php
include("../header_ad/header.php");
?>

<div class="content-wrapper">

	<section class="content-header">
		<h1>Dashboard</h1>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-primary">
					<div class="inner">
						<h3>
							<?php
							$product_count = mysqli_query($conn, "SELECT COUNT(Fabric_Code) as total_product FROM category");
							$row_product_count = mysqli_fetch_assoc($product_count);
							echo $row_product_count['total_product'];
							?>
						</h3>

						<p>Products</p>
					</div>
					<div class="icon">
						<i class="ionicons ion-android-cart"></i>
					</div>

				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-maroon">
					<div class="inner">
						<h3>
							<?php
							$pending_count = mysqli_query($conn, "SELECT COUNT(Order_Code) as pending_order FROM `order` WHERE Status_by_time = 'Partial Paid'");
							$row_pending_count = mysqli_fetch_assoc($pending_count);
							echo $row_pending_count['pending_order'];
							?>
						</h3>
						<p>Pending Orders</p>
					</div>
					<div class="icon">
						<i class="ionicons ion-clipboard"></i>
					</div>

				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>
						<?php
							$complete_count = mysqli_query($conn, "SELECT COUNT(Order_Code) as complete_order FROM `order` WHERE Status_by_time = 'Full Paid'");
							$row_complete_count = mysqli_fetch_assoc($complete_count);
							echo $row_complete_count['complete_order'];
							?>
						</h3>
						</h3>
						<p>Completed Orders</p>
					</div>
					<div class="icon">
						<i class="ionicons ion-android-checkbox-outline"></i>
					</div>

				</div>
			</div>

			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-olive">
					<div class="inner">
						<h3>
							<?php
							echo $row_product_count['total_product'];
							?>
						</h3>

						<p>Top Categories</p>
					</div>
					<div class="icon">
						<i class="ionicons ion-arrow-up-b"></i>
					</div>

				</div>
			</div>

		</div>
	</section>
</div>
</div>

<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<script src="js/select2.full.min.js"></script>
<script src="js/jquery.inputmask.js"></script>
<script src="js/jquery.inputmask.date.extensions.js"></script>
<script src="js/jquery.inputmask.extensions.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/icheck.min.js"></script>
<script src="js/fastclick.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/app.min.js"></script>
<script src="js/jscolor.js"></script>
<script src="js/on-off-switch.js"></script>
<script src="js/on-off-switch-onload.js"></script>
<script src="js/clipboard.min.js"></script>
<script src="js/demo.js"></script>
<script src="js/summernote.js"></script>

<script>
	$(document).ready(function() {
		$('#editor1').summernote({
			height: 300
		});
		$('#editor2').summernote({
			height: 300
		});
		$('#editor3').summernote({
			height: 300
		});
		$('#editor4').summernote({
			height: 300
		});
		$('#editor5').summernote({
			height: 300
		});
	});
	$(".top-cat").on('change', function() {
		var id = $(this).val();
		var dataString = 'id=' + id;
		$.ajax({
			type: "POST",
			url: "get-mid-category.html",
			data: dataString,
			cache: false,
			success: function(html) {
				$(".mid-cat").html(html);
			}
		});
	});
	$(".mid-cat").on('change', function() {
		var id = $(this).val();
		var dataString = 'id=' + id;
		$.ajax({
			type: "POST",
			url: "get-end-category.html",
			data: dataString,
			cache: false,
			success: function(html) {
				$(".end-cat").html(html);
			}
		});
	});
</script>

<script>
	$(function() {

		//Initialize Select2 Elements
		$(".select2").select2();

		//Datemask dd/mm/yyyy
		$("#datemask").inputmask("dd-mm-yyyy", {
			"placeholder": "dd-mm-yyyy"
		});
		//Datemask2 mm/dd/yyyy
		$("#datemask2").inputmask("mm-dd-yyyy", {
			"placeholder": "mm-dd-yyyy"
		});
		//Money Euro
		$("[data-mask]").inputmask();

		//Date picker
		$('#datepicker').datepicker({
			autoclose: true,
			format: 'dd-mm-yyyy',
			todayBtn: 'linked',
		});

		$('#datepicker1').datepicker({
			autoclose: true,
			format: 'dd-mm-yyyy',
			todayBtn: 'linked',
		});

		//iCheck for checkbox and radio inputs
		$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
			checkboxClass: 'icheckbox_minimal-blue',
			radioClass: 'iradio_minimal-blue'
		});
		//Red color scheme for iCheck
		$('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
			checkboxClass: 'icheckbox_minimal-red',
			radioClass: 'iradio_minimal-red'
		});
		//Flat red color scheme for iCheck
		$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
			checkboxClass: 'icheckbox_flat-green',
			radioClass: 'iradio_flat-green'
		});



		$("#example1").DataTable();
		$('#example2').DataTable({
			"paging": true,
			"lengthChange": false,
			"searching": false,
			"ordering": true,
			"info": true,
			"autoWidth": false
		});

		$('#confirm-delete').on('show.bs.modal', function(e) {
			$(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
		});

		$('#confirm-approve').on('show.bs.modal', function(e) {
			$(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
		});

	});

	function confirmDelete() {
		return confirm("Are you sure want to delete this data?");
	}

	function confirmActive() {
		return confirm("Are you sure want to Active?");
	}

	function confirmInactive() {
		return confirm("Are you sure want to Inactive?");
	}
</script>

<script type="text/javascript">
	function showDiv(elem) {
		if (elem.value == 0) {
			document.getElementById('photo_div').style.display = "none";
			document.getElementById('icon_div').style.display = "none";
		}
		if (elem.value == 1) {
			document.getElementById('photo_div').style.display = "block";
			document.getElementById('photo_div_existing').style.display = "block";
			document.getElementById('icon_div').style.display = "none";
		}
		if (elem.value == 2) {
			document.getElementById('photo_div').style.display = "none";
			document.getElementById('photo_div_existing').style.display = "none";
			document.getElementById('icon_div').style.display = "block";
		}
	}

	function showContentInputArea(elem) {
		if (elem.value == 'Full Width Page Layout') {
			document.getElementById('showPageContent').style.display = "block";
		} else {
			document.getElementById('showPageContent').style.display = "none";
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnAddNew").click(function() {

			var rowNumber = $("#ProductTable tbody tr").length;

			var trNew = "";

			var addLink = "<div class=\"upload-btn" + rowNumber + "\"><input type=\"file\" name=\"photo[]\"  style=\"margin-bottom:5px;\"></div>";

			var deleteRow = "<a href=\"javascript:void()\" class=\"Delete btn btn-danger btn-xs\">X</a>";

			trNew = trNew + "<tr> ";

			trNew += "<td>" + addLink + "</td>";
			trNew += "<td style=\"width:28px;\">" + deleteRow + "</td>";

			trNew = trNew + " </tr>";

			$("#ProductTable tbody").append(trNew);

		});

		$('#ProductTable').delegate('a.Delete', 'click', function() {
			$(this).parent().parent().fadeOut('slow').remove();
			return false;
		});

	});



	var items = [];
	for (i = 1; i <= 24; i++) {
		items[i] = document.getElementById("tabField" + i);
	}

	items[1].style.display = 'block';
	items[2].style.display = 'block';
	items[3].style.display = 'block';
	items[4].style.display = 'none';

	items[5].style.display = 'block';
	items[6].style.display = 'block';
	items[7].style.display = 'block';
	items[8].style.display = 'none';

	items[9].style.display = 'block';
	items[10].style.display = 'block';
	items[11].style.display = 'block';
	items[12].style.display = 'none';

	items[13].style.display = 'block';
	items[14].style.display = 'block';
	items[15].style.display = 'block';
	items[16].style.display = 'none';

	items[17].style.display = 'block';
	items[18].style.display = 'block';
	items[19].style.display = 'block';
	items[20].style.display = 'none';

	items[21].style.display = 'block';
	items[22].style.display = 'block';
	items[23].style.display = 'block';
	items[24].style.display = 'none';

	function funcTab1(elem) {
		var txt = elem.value;
		if (txt == 'Image Advertisement') {
			items[1].style.display = 'block';
			items[2].style.display = 'block';
			items[3].style.display = 'block';
			items[4].style.display = 'none';
		}
		if (txt == 'Adsense Code') {
			items[1].style.display = 'none';
			items[2].style.display = 'none';
			items[3].style.display = 'none';
			items[4].style.display = 'block';
		}
	};

	function funcTab2(elem) {
		var txt = elem.value;
		if (txt == 'Image Advertisement') {
			items[5].style.display = 'block';
			items[6].style.display = 'block';
			items[7].style.display = 'block';
			items[8].style.display = 'none';
		}
		if (txt == 'Adsense Code') {
			items[5].style.display = 'none';
			items[6].style.display = 'none';
			items[7].style.display = 'none';
			items[8].style.display = 'block';
		}
	};

	function funcTab3(elem) {
		var txt = elem.value;
		if (txt == 'Image Advertisement') {
			items[9].style.display = 'block';
			items[10].style.display = 'block';
			items[11].style.display = 'block';
			items[12].style.display = 'none';
		}
		if (txt == 'Adsense Code') {
			items[9].style.display = 'none';
			items[10].style.display = 'none';
			items[11].style.display = 'none';
			items[12].style.display = 'block';
		}
	};

	function funcTab4(elem) {
		var txt = elem.value;
		if (txt == 'Image Advertisement') {
			items[13].style.display = 'block';
			items[14].style.display = 'block';
			items[15].style.display = 'block';
			items[16].style.display = 'none';
		}
		if (txt == 'Adsense Code') {
			items[13].style.display = 'none';
			items[14].style.display = 'none';
			items[15].style.display = 'none';
			items[16].style.display = 'block';
		}
	};

	function funcTab5(elem) {
		var txt = elem.value;
		if (txt == 'Image Advertisement') {
			items[17].style.display = 'block';
			items[18].style.display = 'block';
			items[19].style.display = 'block';
			items[20].style.display = 'none';
		}
		if (txt == 'Adsense Code') {
			items[17].style.display = 'none';
			items[18].style.display = 'none';
			items[19].style.display = 'none';
			items[20].style.display = 'block';
		}
	};

	function funcTab6(elem) {
		var txt = elem.value;
		if (txt == 'Image Advertisement') {
			items[21].style.display = 'block';
			items[22].style.display = 'block';
			items[23].style.display = 'block';
			items[24].style.display = 'none';
		}
		if (txt == 'Adsense Code') {
			items[21].style.display = 'none';
			items[22].style.display = 'none';
			items[23].style.display = 'none';
			items[24].style.display = 'block';
		}
	};
</script>

</body>

</html>