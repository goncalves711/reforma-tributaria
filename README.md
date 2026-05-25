# Diagnóstico Reforma Tributária

Simulador de diagnóstico + painel admin com QR Code.

## Stack
- HTML + Vanilla JS + Vite
- Supabase (banco de dados)
- Vercel (hospedagem + serverless function)

---

## 1. Configurar o Supabase

Acesse **supabase.com → seu projeto → SQL Editor** e execute o arquivo `supabase_setup.sql`.

---

## 2. Subir no GitHub

```bash
git init
git add .
git commit -m "feat: simulador reforma tributária"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/SEU_REPO.git
git push -u origin main
```

---

## 3. Deploy no Vercel

1. Acesse **vercel.com → Add New Project → importe o repositório**
2. Antes de clicar em Deploy, vá em **Environment Variables** e adicione:
   - Nome: `ANTHROPIC_API_KEY`
   - Valor: sua chave da API da Anthropic (começa com `sk-ant-...`)
3. Clique em **Deploy**

> A chave da API fica segura no servidor — nunca exposta no frontend.

---

## URLs após o deploy

| Página | URL |
|--------|-----|
| Simulador | `https://seu-projeto.vercel.app/` |
| Painel admin | `https://seu-projeto.vercel.app/painel.html` |

---

## Como obter a ANTHROPIC_API_KEY

1. Acesse **console.anthropic.com**
2. Vá em **API Keys → Create Key**
3. Copie a chave e cole no Vercel como variável de ambiente
