
<div class="gap-30"></div>


<!-- ts-copyright start -->
<div class="ts-copyright">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-12 text-center">
                <div class="copyright-content text-light">
                    <p>&copy; <?=date('Y')?>, <a href="<?=$site->url;?>"><?=$site->baslik_ic;?></a>. Her Hakkı Saklıdır.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ts-copyright end-->

<!-- backto -->
<div class="top-up-btn">
    <div class="backto" style="display: block;">
        <a href="#" class="icon icon-arrow-up" aria-hidden="true"></a>
    </div>
</div>
<!-- backto end-->

<!-- Javascript Files
================================================== -->

<!-- initialize jQuery Library -->
<script src="<?=$site->cdnurl;?>/js/jquery.js"></script>
<!-- Popper Jquery -->
<script src="<?=$site->cdnurl;?>/js/popper.min.js"></script>
<!-- Bootstrap jQuery -->
<script src="<?=$site->cdnurl;?>/js/bootstrap.min.js"></script>
<!-- magnific-popup -->
<script src="<?=$site->cdnurl;?>/js/jquery.magnific-popup.min.js"></script>
<!-- Owl Carousel -->
<script src="<?=$site->cdnurl;?>/js/owl.carousel.min.js"></script>
<!-- Color box -->
<script src="<?=$site->cdnurl;?>/js/jquery.colorbox.js"></script>
<!-- Template custom -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
<script src="<?=$site->cdnurl;?>/js/custom.js"></script>
</body>
</html>
<?php
ob_end_flush();
?>