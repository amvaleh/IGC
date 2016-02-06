(function($) {
	var AccordionSliderExamples = {
		currentExample: -1,

		loadExample: function(index) {
			var that = this;

			if (this.currentExample === index)
				return;

			this.currentExample = index;
            that.renderExample2();
            //$.ajax({
			//	url: '' + index + '.html',
			//	type: 'get',
			//	dataType: 'html',
            //success: function(result) {
			//		that.unloadCurrentExample();
             //       console.log("not success!");
             //       $('section.example').html(result);
            //
			//		switch(that.currentExample) {
			//			case 1:
			//				that.renderExample1();
			//				break;
            //
			//			case 2:
			//				that.renderExample2();
			//				break;
            //
			//			case 3:
			//				that.renderExample3();
			//				break;
            //
			//			case 4:
			//				that.renderExample4();
			//				break;
			//		}
			//	}
			//});
		},


		renderExample2: function() {
			$('#example2').accordionSlider({
				width: 960,
				height: 400,
				responsiveMode: 'custom',
				autoplay: false,
				mouseWheel:false,
				breakpoints: {
					700: {visiblePanels: 6},
					500: {visiblePanels: 4}
				}
			});

			// instantiate fancybox when a link is clicked
			$('#example2 .as-panel > a').on('click', function(event) {
				event.preventDefault();

				// check if the clicked link is also used in swiping the accordion
				// by checking if the link has the 'as-swiping' class attached.
				// if the accordion is not being swiped, open the lightbox programmatically,
				// at the correct index
				if ($(this).hasClass('as-swiping') === false)
					$.fancybox.open($('#example2 .as-panel > a'), {index:$(this).parent().index()});
			});
		},


		unloadCurrentExample: function() {
			var accordion = $('section.example').find('.accordion-slider');

			accordion.accordionSlider('destroy');
			$('section.example').empty();
		}
	};

	jQuery(document).ready(function() {
		AccordionSliderExamples.loadExample(1);

		$('.example-switcher div').click(function() {
			AccordionSliderExamples.loadExample($(this).index() + 1);
		});
	});
})(jQuery);