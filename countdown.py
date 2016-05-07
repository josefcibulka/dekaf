#!/usr/bin/env python
# coding=utf-8
#
# From http://www.eurion.net/python-snippets/snippet/Count down timer.html
#
# [SNIPPET_NAME: Count down timer]
# [SNIPPET_CATEGORIES: PyGTK, gobject]
# [SNIPPET_DESCRIPTION: Two examples of how to make a count down timer]
# [SNIPPET_LICENSE: GPL]
# [SNIPPET_AUTHOR: Simon Vermeersch <simonvermeersch@gmail.com>]
# [SNIPPET_DOCS: http://www.pygtk.org/pygtk2reference/gobject-functions.html#function-gobject--timeout-add]

import gtk, gobject, pango
import sys

class CounterApp:
    def __init__(self):
        self.w = gtk.Window()
	self.w.set_title(sys.argv[2])
        self.w.connect("destroy", lambda wid: gtk.main_quit())
        self.w.connect("delete_event", lambda a1,a2:gtk.main_quit())

        vbox = gtk.VBox()
        self.w.add(vbox)

        self.label = gtk.Label("Counter example")
        self.label.modify_font(pango.FontDescription("sans 28"))
        self.label.set_line_wrap(True)
        self.label.set_size_request(1050,-1)
        vbox.pack_start(self.label)

        hbox = gtk.HBox()
        vbox.pack_start(hbox)

        btn1 = gtk.Button("OK")
        btn1.connect("clicked", self.btn1_clicked)
        hbox.pack_start(btn1)

        btn2 = gtk.Button("Cancel")
        btn2.connect("clicked", self.btn2_clicked)
        hbox.pack_start(btn2)
        btn2.grab_focus()

        self.w.show_all()
        self.start_timer()
        
    def btn1_clicked(self, sender):
        sys.exit(0)

    def btn2_clicked(self, sender):
        sys.exit(1)

    def start_timer(self):
        timeToWait = int(sys.argv[1])
        counter = timeToWait
        while counter >= 0:
            gobject.timeout_add(counter * 1000, self.countdown_function_method1, timeToWait-counter)
            counter -= 1

    def countdown_function_method1(self, counter):
        if counter > 0:
            self.label.set_text(sys.argv[3] + str(counter) + sys.argv[4])
        else:
            gtk.main_quit()

if __name__ == "__main__":
    app = CounterApp()
    gtk.main()
    sys.exit(0)
