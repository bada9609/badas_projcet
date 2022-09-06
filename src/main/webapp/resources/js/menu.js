jQuery(document).ready(
			function(e) {
				function t(t) {
					e(t).bind("click", function(t) {
						t.preventDefault();
						e(this).parent().fadeOut()
					})
				}
				e(".dropdowns-toggle").click(
						function() {
							var t = e(this).parents(".button-dropdowns")
									.children(".dropdowns-menu").is(":hidden");
							e(".button-dropdowns .dropdowns-menu").hide();
							e(".button-dropdowns .dropdowns-toggle").removeClass(
									"active");
							if (t) {
								e(this).parents(".button-dropdowns").children(
										".dropdowns-menu").toggle().parents(
										".button-dropdowns").children(
										".dropdowns-toggle").addClass("active")
							}
						});
				e(document).bind("click", function(t) {
					var n = e(t.target);
					if (!n.parents().hasClass("button-dropdowns"))
						e(".button-dropdowns .dropdowns-menu").hide();
				});
				e(document).bind(
						"click",
						function(t) {
							var n = e(t.target);
							if (!n.parents().hasClass("button-dropdowns"))
								e(".button-dropdowns .dropdowns-toggle")
										.removeClass("active");
						})
			});