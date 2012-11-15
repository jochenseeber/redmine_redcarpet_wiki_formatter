# -*- coding: utf-8 -*-
#
# Redmine Redcarpet Formatter
# Copyright (C) 2012 Takashi Okamoto
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
require 'redcarpet'

module RedmineRedcarpetWikiFormatter
    class Html < Redcarpet::Render::HTML
        def format_code(code, language)
            result = nil

            if language.nil? then
                result = "<code>#{ERB::Util.h(code)}</code>"
            else
                result = "<code class='#{language} syntaxhl'>#{Redmine::SyntaxHighlighting.highlight_by_language(code, language)}</code>"
            end

            result
        rescue => ex
            puts ex
            Rails.logger.error "Error formatting wiki content with Redcarpet: #{ex}"
            ERB::Util.h(code)
        end

        def block_code(code, language)
            "<pre class='syntaxhl'>#{format_code(code, language)}</pre>"
        end

        def codespan(code)
            format_code(code, nil)
        end
    end

    class Formatter
        @@markdown = ::Redcarpet::Markdown.new(Html, :autolink => true, :fenced_code_blocks => true, :space_after_headers => true, :strikethrough => true, :superscript => true, :tables => true)
        def initialize(text)
            @text = text
        end

        def to_html(*args)
            @@markdown.render(@text)
        rescue => ex
            Rails.logger.error "Error formatting wiki content with Redcarpet: #{ex}"
            ERB::Util.h(text)
        end
    end
end
