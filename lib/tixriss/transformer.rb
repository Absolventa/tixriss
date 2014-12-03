module Tixriss
  class Transformer

    class HTML < Struct.new(:xml)
      def to_s
        [header, body, footer].join "\n"
      end

      def rows
        links.map do |row|
          data = row.map { |cell| "<td>#{cell}</td>" }.join
          "<tr>#{data}</tr>"
        end
      end

      def links
        rows = document.xpath('//response/answer/link').map(&:to_s)
        rows.map do |row|
          node = Nokogiri::XML(row)
          url_from = node.xpath('//@url.from')
          url_to   = node.xpath('//@url.to')
          text     = node.xpath('//@text')

          [url_from, url_to, text]
        end
      end

      def document
        @document ||= Nokogiri::XML(xml)
      end

      def body
        <<-EOBODY
<body>
<table class="table table-striped">
  <thead>
    <tr>
      <th>From</th>
      <th>To</th>
      <th>Text</th>
    </tr>
  </thead>
  <tbody>
    #{rows.join("\n")}
  </tbody>
</table>
</body>
EOBODY
      end

      def header
        <<-EOHEADER
<html>
<head>
  <title>Tixriss Report</title>
  <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap-combined.min.css" rel="stylesheet"/>
</head>
EOHEADER
      end

      def footer
        '</html>'
      end
    end

    attr_reader :input

    def initialize(input)
      @input = input
    end

    def output
      HTML.new(input).to_s
    end

    private

    def output_file
      @output_file ||= File.new(output, 'w+')
    end

  end
end
