using System;
using System.Windows.Forms;
using FrbaCommerce.Entity;

namespace FrbaCommerce.Controles
{
	public partial class ucFechas : UserControl
	{
		#region Miembro de datos

		private string formato = "dd/MM/yyyy";
		private string nombre = "Fecha";
		private DateTime _fecha = Config.FechaSistema;

		#endregion

		#region Propiedades

		public string Nombre
		{
			get { return nombre; }
			set 
			{ 
				nombre = value;
				lbTextoFecha.Text = value;
			}
		}

		public DateTime Fecha
		{
			get { return _fecha; }
			set
			{
				_fecha = value;
				tbFecha.Text = _fecha.ToString(formato);
			}
		}

		public string Formato
		{
			get { return formato; }
			set { formato = value; }
		}

		#endregion

		#region Constructor
		public ucFechas()
		{
			InitializeComponent();
			Fecha = Config.FechaSistema;
            tbFecha.Text = _fecha.ToString(formato);
		}
		#endregion

		#region Eventos
		
		private void OnSeleccionarClick(object sender, EventArgs e)
		{
			using (FechaDialog dialog = new FechaDialog())
			{
				dialog.Fecha = Fecha;
				if (dialog.ShowDialog() == DialogResult.OK)
				{
					Fecha = dialog.Fecha;
				}
			}
		}

		#endregion
	}
}
