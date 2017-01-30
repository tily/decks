require "sinatra"
require "haml"
require "open-uri"

get "/:username/:gist_id/:filename" do
  url = "https://gist.githubusercontent.com/%s/%s/raw/deck.md"% [params[:username], params[:gist_id], params[:filename]]
  @text = open(url).read
  erb :index
end

__END__
@@ index
<!doctype html>
<!-- forked from https://github.com/hakimel/reveal.js/blob/master/index.html -->
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>reveal.js</title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/reveal.js/3.0.0/css/reveal.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/reveal.js/3.0.0/css/theme/black.css">

		<!-- Theme used for syntax highlighting of code -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/reveal.js/3.0.0/lib/css/zenburn.css">

		<!-- Printing and PDF exports -->
		<script>
			var link = document.createElement( 'link' );
			link.rel = 'stylesheet';
			link.type = 'text/css';
			link.href = window.location.search.match( /print-pdf/gi ) ? 'css/print/pdf.css' : 'css/print/paper.css';
			document.getElementsByTagName( 'head' )[0].appendChild( link );
		</script>
	</head>
	<body>
		<div class="reveal">
			<div class="slides">
				<section data-markdown data-separator="\n---\n$" data-vertical="\n--\n">
					<script type="text/template">
					<%= @text %>
					</script>
				</section>
			</div>
		</div>

		<script src="https://cdn.jsdelivr.net/reveal.js/3.0.0/js/reveal.min.js"></script>
		<script src="https://cdn.jsdelivr.net/reveal.js/3.0.0/lib/js/head.min.js"></script>

		<script>
			Reveal.initialize({
				history: true,
				// More info https://github.com/hakimel/reveal.js#dependencies
				dependencies: [
					{ src: 'https://cdn.jsdelivr.net/reveal.js/3.0.0/plugin/markdown/marked.js' },
					{ src: 'https://cdn.jsdelivr.net/reveal.js/3.0.0/plugin/markdown/markdown.js' },
					{ src: 'https://cdn.jsdelivr.net/reveal.js/3.0.0/plugin/notes/notes.js', async: true },
					{ src: 'https://cdn.jsdelivr.net/reveal.js/3.0.0/plugin/highlight/highlight.js', async: true,
                                          callback: function() { hljs.initHighlightingOnLoad(); } }
				]
			});
		</script>
	</body>
</html>
