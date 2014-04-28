using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaCommerce.Controles
{
	public partial class FechaDialog : Form
	{
		private DateTime _fecha = DateTime.Today;

		public FechaDialog()
		{
			InitializeComponent();
		}

		public DateTime Fecha
		{
			get { return _fecha; }
			set { _fecha = value; }
		}

		private void OnCancelarClick(object sender, EventArgs e)
		{
			this.DialogResult = DialogResult.Cancel;
		}

		private void OnAceptarClick(object sender, EventArgs e)
		{
			Fecha = mcFecha.SelectionRange.Start;
			this.DialogResult = DialogResult.OK;
		}

		private void OnLoad(object sender, EventArgs e)
		{
			mcFecha.SetDate(_fecha);
		}
	}
}
