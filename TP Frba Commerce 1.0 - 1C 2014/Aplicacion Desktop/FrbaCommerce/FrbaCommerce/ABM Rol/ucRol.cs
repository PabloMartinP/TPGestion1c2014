using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCommerce.Entity;
using FrbaCommerce.Controller;
namespace FrbaCommerce.AbmRol
{
    public partial class ucRol : UserControl
    {
        
        public Rol Rol { get; set; }
        public ucRol()
        {
            InitializeComponent();
        }

        public void LimpiarTodo()
        {
            this.LimpiarCampos();
            //this.LimpiarCmbTipo();
            txtNombre.Text = "";
        }
        public void CargarRol(Rol rol)
        {
            //cmbTipo.SelectedValue = rol.Tipo.ID;

            this.CargarFuncionalidades(rol);
            txtNombre.Text = rol.Nombre;
            
            

        }
        /// <summary>
        /// lockeo cosas para que no modfiique nada
        /// </summary>
        public void SoloLectura()
        {
            txtNombre.ReadOnly = true;
            flpFuncionalidades.Enabled = false;
        }
        public string Nombre()
        {
            return txtNombre.Text;
        }
        

        /// <summary>
        /// devuelvo el rol seleccionado, con el tipo y las funcionalidades chequeadas
        /// </summary>  
        public Rol ObtenerRol()
        {
            Rol rol = new Rol();

            rol.Nombre = txtNombre.Text;
            rol.Funcionalidades = ObtenerFuncionalidades();

            return rol;
        }
        private void ucRol_Load(object sender, EventArgs e)
        {

        }
        public string ValidarCampos()
        {
            string s = "";
            
            if (txtNombre.Text=="")
                s = s + "- No ingreso un nombre.";
			if (!ObtenerFuncionalidades().Any(m => m.Permitida))
			{
				s = s + "- El rol debe tener funcionalidades asignadas";
			}

            return s;
        }
        
        public void DeshabilitarFuncionalidades()
        {
            gbFuncionalidades.Enabled = false;
            Rol.Habilitado = false;
            LimpiarCheckBox();
        }
        public void HabilitarFuncionalidades()
        {
            gbFuncionalidades.Enabled = true;
            Rol.Habilitado = true;
            //CargarFuncionalidades();
        }
        private void frmRol_Load(object sender, EventArgs e)
        {

            //CargarFuncionalidades();
        }
                
        /// <summary>
        /// carga las funcionalidades vacias
        /// </summary>
        public void CargarFuncionalidades()
        {
            //para que cargue de un rol inexistente
            Rol = new Rol();
            Rol.ID = -1;

            CargarFuncionalidades(Rol);
        }
        /// <summary>
        /// carga las funcionalidades de un determinado ROl
        /// </summary>
        public void CargarFuncionalidades(Rol unRol)
        {
            CheckBox chkFunc;
            //x => x.Id == IdToFind
            //foreach Func in FuncionalidadController.Listar(Sesion.Usuario.Rol)
            this.flpFuncionalidades.Controls.Clear();
            FuncionalidadController fc = new FuncionalidadController(); 

            foreach (Funcionalidad unaFuncionalidad in fc.Listar(unRol.ID))
            {
                chkFunc = new CheckBox();

                chkFunc.Size = new System.Drawing.Size(190, 24);

                chkFunc.Name = "chk" + unaFuncionalidad.ID;
                chkFunc.Text = unaFuncionalidad.Nombre;
                chkFunc.Checked = unaFuncionalidad.Permitida;

                chkFunc.Tag = unaFuncionalidad;

                this.flpFuncionalidades.Controls.Add(chkFunc);
            }

        }
        public List<Funcionalidad> ObtenerFuncionalidades()
        {
            List<Funcionalidad> listado = new List<Funcionalidad>();
            Funcionalidad f;
            foreach (CheckBox chk in flpFuncionalidades.Controls)
            {
                f = (Funcionalidad)chk.Tag;
                f.Permitida = chk.Checked;
                listado.Add(f);

            }
            return listado;
        }

        public List<Funcionalidad> FuncionalidadesChequeadas()
        {
            List<Funcionalidad> listado = new List<Funcionalidad>();
            Funcionalidad f;
            foreach (CheckBox chk in flpFuncionalidades.Controls)
            {
                f = (Funcionalidad)chk.Tag;

                f.Permitida = chk.Checked;

                listado.Add(f);

            }
            return listado;
        }
      
        /// <summary>
        /// limpia los checkbox
        /// </summary>
        public virtual void LimpiarCampos()
        {

            LimpiarCheckBox();

        }
        private void LimpiarCheckBox()
        {
            foreach (CheckBox chk in flpFuncionalidades.Controls)
            {
                chk.Checked = false;
            }
        }

    }
}
