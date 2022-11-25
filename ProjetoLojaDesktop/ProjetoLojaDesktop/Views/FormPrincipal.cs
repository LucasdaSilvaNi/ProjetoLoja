﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ProjetoLojaDesktop.Forms;
using ProjetoLojaDesktop.Views;
using ProjetoLojaDesktop.Views.Relatorios.RelatorioOS;
using ProjetoLojaDesktop.Views.Relatorios.Produto;
using ProjetoLojaDesktop.Views.Relatorios.PagtoCartao;

namespace ProjetoLojaDesktop
{
    public partial class FormPrincipal : Form
    {
        public FormPrincipal()
        {
            InitializeComponent();
            criarTooltips();
            new FormLogin().ShowDialog();
        }

        public void criarTooltips()
        {
            ToolTip tooltip = new ToolTip();
            tooltip.SetToolTip(btnCliente, "Clientes");
            tooltip.SetToolTip(btnFornecedor, "Fornecedor");
            tooltip.SetToolTip(btnUsuario, "Usuario");
            tooltip.SetToolTip(btnModelo, "Modelo");
            tooltip.SetToolTip(btnMarca, "Marca");
            tooltip.SetToolTip(btnFinanceiro, "Financeiro");
            tooltip.SetToolTip(btnRelatorio, "Relatorio");
            tooltip.SetToolTip(btnSair, "Sair");
        }

        private void btnCliente_Click(object sender, EventArgs e)
        {
            new FormCadastroCliente().Show();
        }

        private void btnFornecedor_Click(object sender, EventArgs e)
        {
            new FormFornecedor().Show();
        }

        private void btnUsuario_Click(object sender, EventArgs e)
        {
            new FormCadFuncionarios().Show();
        }

        private void btnModelo_Click(object sender, EventArgs e)
        {
            new FormModelo().Show();
        }

        private void btnMarca_Click(object sender, EventArgs e)
        {
            new FormMarca().Show();
        }

        private void clienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormCadastroCliente().Show();
        }

        private void fornecerdorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormFornecedor().Show();
        }

        private void usuárioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormCadFuncionarios().Show();
        }

        private void cadastrarMarcaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormMarca().Show();
        }

        private void cadastrarModeloToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormModelo().Show();
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Deseja Sair do Programa?", "Exit", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                Application.Exit();
            }
        }

        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Deseja Sair do Programa?", "Exit", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                Application.Exit();
            }
        }

        private void vendaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormVenda().Show();
        }

        private void btnVenda_Click(object sender, EventArgs e)
        {
            new FormVenda().Show();
        }

        private void cadastrarProdutoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormProdutos().Show();
        }

        private void ordensDeServiçosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormRelatorioOS().Show();
        }

        private void produtosToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            new FormProduto().Show();
        }

        private void pagamentoCartãoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormPagamentoCartao().Show();
        }

        private void entradasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new FormEntradas().Show();
        }
    }
}
