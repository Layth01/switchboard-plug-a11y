


public class Accessibility.Widgets.SettingsBox : Gtk.Frame {
    private Gtk.ListBox list_box;
    private bool has_childen = false;
    
	public SettingsBox () {
		list_box = new Gtk.ListBox ();
		this.add (list_box);
		
		this.add.connect (() => {
		   
		});
	}

	public void add_widget (string title, Gtk.Widget widget) {
	    var settings_box = new Accessibility.Widgets.EmptyBox (title, has_childen);
        widget.set_margin_end (12);

 		settings_box.grid.add (widget);
        list_box.add (settings_box);
        show_all ();
        
        has_childen = true;
	}

	public Gtk.ComboBox add_combo_box (string title) {
	    var settings_box = new Accessibility.Widgets.EmptyBox (title, has_childen);
        var combo = new Gtk.ComboBox ();
        combo.set_size_request (180,0);
        combo.set_margin_end (12);
        
	    settings_box.grid.add (combo);
        list_box.add (settings_box);
        show_all ();
        
        has_childen = true;
        return combo;
	}

	public Gtk.Scale add_scale (string title, Gtk.Adjustment adjustment) {
		var settings_box = new Accessibility.Widgets.EmptyBox (title, has_childen);
        var scale = new Gtk.Scale (Gtk.Orientation.HORIZONTAL, adjustment);
        scale.set_size_request (250,0);
        scale.set_draw_value (false);
        scale.set_margin_end (12);

 		settings_box.grid.add (scale);
        list_box.add (settings_box);
        show_all ();
        
        has_childen = true;
        return scale;
	}

	public Gtk.Switch add_switch (string title) {
	    var settings_box = new Accessibility.Widgets.EmptyBox (title, has_childen);
        var toggle = new Gtk.Switch ();

	    settings_box.grid.add (toggle);
        list_box.add (settings_box);
        show_all ();
        
        has_childen = true;
        return toggle;
	}
}

public class Accessibility.Widgets.EmptyBox : Gtk.ListBoxRow {

    public Gtk.Grid grid;
    public Gtk.Label label;

    public EmptyBox (string title, bool add_separator) {
	    set_activatable (false);
	    set_selectable (false);

		var main_grid = new Gtk.Grid ();
        var separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);

		label = new Gtk.Label (title);
        label.hexpand = true;
        label.halign = Gtk.Align.START;
        label.margin = 8;

        grid = new Gtk.Grid ();
        grid.hexpand = true;
        grid.halign = Gtk.Align.END;
        grid.set_margin_end (4);
        grid.set_margin_top (8);
        grid.set_margin_bottom (8);

        if (add_separator) {
            main_grid.attach (separator, 0, 0, 2, 1);
        }
        
        main_grid.attach (label, 0, 1, 1, 1);
        main_grid.attach (grid, 1, 1, 1, 1);
        add (main_grid);

        show_all ();
    }
}
