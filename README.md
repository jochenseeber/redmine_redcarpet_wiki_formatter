Redmine Redcarpet (Markdown) Formatter  Plugin
==============================================

Redmine Plugin that allows you to write wiki pages using [Markdown][Markdown] ([Redcarpet][Redcarpet] style). 

[Markdown]: http://daringfireball.net/projects/markdown "Markdown"
[Redcarpet]: https://github.com/vmg/redcarpet "Redcarpet"

Features
--------

* Edit wiki pages using Markdown

* Edit rich text fields using Markdown

Installation and Setup
----------------------

* The plugin requires at least Redmine 2.1

* Open a shell and cd into your Redmine installation directory

* Install the plugin

        cd plugins
        git clone https://github.com/jochenseeber/redmine_redcarpet_wiki_formatter.git
    
* Run the database migration

        RAILS_ENV=production rake redmine:plugins:migrate
    
* Restart Redmine

License
-------

This plugin is licensed under the [GNU Affero General Public License][agpl].

[agpl]: http://www.gnu.org/licenses/agpl-3.0.html "GNU Affero General Public License"
