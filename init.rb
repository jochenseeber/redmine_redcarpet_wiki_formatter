#
# Copyright 2012 Jochen Seeber
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
require 'rubygems'
require 'uv'
require 'redmine_redcarpet_wiki_formatter/formatter'

Redmine::Plugin.register :redmine_redcarpet_wiki_formatter do
    name 'Redcarpet Wiki Formatter Plugin'
    author 'Jochen Seeber'
    description 'Redcarpet Wiki Formatte Plugin for Redmine 2.x'
    version '0.0.1'
    url 'https://github.com/jochenseeber/redmine_redcarpet_wiki_formatter'
    author_url 'http://www.noussommesdesoles.net'

    wiki_format_provider 'markdown (redcarpet)', RedmineRedcarpetWikiFormatter::Formatter, nil
end
