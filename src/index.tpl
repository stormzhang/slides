<!doctype html>
<html lang="en">

	<head>
		<meta charset="utf-8">

		<title>{{title}}</title>

		<meta name="description" content="A framework for easily creating beautiful presentations using HTML">
		<meta name="author" content="Hakim El Hattab">

		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">

		<link rel="stylesheet" href="{{{prefix}}}css/reveal.css">
		<link rel="stylesheet" href="{{{prefix}}}css/theme/black.css" id="theme">

		<!-- Code syntax highlighting -->
		<link rel="stylesheet" href="{{{prefix}}}lib/css/zenburn.css">

		<!-- Printing and PDF exports -->
		<script>
			var link = document.createElement( 'link' );
			link.rel = 'stylesheet';
			link.type = 'text/css';
			link.href = window.location.search.match( /print-pdf/gi ) ? '{{{prefix}}}css/print/pdf.css' : '{{{prefix}}}css/print/paper.css';
			document.getElementsByTagName( 'head' )[0].appendChild( link );
		</script>

		<!--[if lt IE 9]>
		<script src="lib/js/html5shiv.js"></script>
		<![endif]-->
	</head>

	<body>

		<div class="reveal">
			<div class="slides">{{{slides}}}</div>
		</div>

		<script src="{{{prefix}}}lib/js/head.min.js"></script>
		<script src="{{{prefix}}}js/reveal.js"></script>

		<script>

			// Full list of configuration options available at:
			// https://github.com/hakimel/reveal.js#configuration
			Reveal.initialize({
				controls: true,
				progress: true,
				history: true,
				center: true,

				transition: 'slide', // none/fade/slide/convex/concave/zoom

				// Optional reveal.js plugins
				dependencies: [
					{ src: '{{{prefix}}}lib/js/classList.js', condition: function() { return !document.body.classList; } },
					{ src: '{{{prefix}}}plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: '{{{prefix}}}plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: '{{{prefix}}}plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
					{ src: '{{{prefix}}}plugin/zoom-js/zoom.js', async: true },
					{ src: '{{{prefix}}}plugin/notes/notes.js', async: true }
				]
			});

		</script>

	</body>
</html>
