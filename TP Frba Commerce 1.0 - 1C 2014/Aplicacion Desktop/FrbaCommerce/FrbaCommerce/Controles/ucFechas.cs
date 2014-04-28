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
		private DateTime _fechaSelected = Config.FechaSistema;

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

		public DateTime FechaSelected
		{
			get { return _fechaSelected; }
			set
			{
				_fechaSelected = value;
				tbFecha.Text = _fechaSelected.ToString(formato);
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
			FechaSelected = Config.FechaSistema;
            tbFecha.Text = _fechaSelected.ToString(formato);
		}
		#endregion

		#region Eventos
		
		private void OnSeleccionarClick(object sender, EventArgs e)
		{
			using (FechaDialog dialog = new FechaDialog())
			{
				dialog.Fecha = FechaSelected;
				if (dialog.ShowDialog() == DialogResult.OK)
				{
					FechaSelected = dialog.Fecha;
				}
			}
		}

		#endregion
	}
}
