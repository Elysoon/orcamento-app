# Orçamento

App web instalável (PWA) para autônomos e pequenas empresas: orçamentos, ordens de serviço, pedidos, recibos e contratos em PDF, com clientes, catálogo, agenda e financeiro. Funciona no navegador do Android, iPhone e computador, e pode ser instalado na tela inicial. Funciona sem internet; com conta, sincroniza na nuvem (Firebase).

## Funções
- **Documentos:** orçamento, ordem de serviço (equipamento, defeito, laudo), pedido de venda, recibo (valor por extenso) e contrato (modelo com campos automáticos).
- Produtos e serviços em seções separadas, desconto em R$ ou %, acréscimo/deslocamento, validade, prazo, garantia, forma de pagamento, PIX.
- Fotos no PDF, assinatura do cliente na tela e assinatura da empresa salva.
- PDF com logo e cor escolhida; enviar pelo WhatsApp ou compartilhar o arquivo.
- Converter orçamento em OS, pedido, contrato ou recibo; duplicar; situação (rascunho, enviado, aprovado, recusado…).
- **Clientes** com histórico, WhatsApp e ligação.
- **Catálogo** com foto, custo, preço e margem; importar/exportar CSV (`tipo;nome;unidade;preco;custo;categoria`).
- **Agenda** mensal, lembrete 30 min antes, exportar para a agenda do celular (.ics), abrir no mapa.
- **Financeiro:** entradas e saídas, a receber/a pagar, parcelas, gráfico de 6 meses; recibo gera entrada sozinho.
- **Relatórios:** taxa de aprovação, ticket médio, lucro estimado, clientes e itens que mais faturam.
- Backup/restauração em arquivo, tema claro/escuro, dados de exemplo.

## Nuvem, ativação e vouchers (Firebase)
Usa o projeto `esm-orcamento`. Os dados ficam em `orcamento_web/<uid>`. Cole os blocos de `REGRAS-FIREBASE.json` dentro de `"rules"` no Realtime Database.

- **Modo teste:** sem ativação dá para criar 5 documentos (`LIMITE_TESTE`).
- **Voucher:** o administrador gera códigos em Mais → Administração; o cliente ativa em Mais → Ativar acesso completo.
- **Administrador:** no banco, `admins/<UID> = true`.
- **Pagamento (ESM Pay):** preencha `PAGAMENTO.url` no `app.html`. O app abre o checkout com `?ref=<uid>&email=<email>`. Ao confirmar o pagamento, o ESM Pay grava (com credencial de servidor) `licencas/<ref> = {"ativo": true, "origem": "pagamento", "email": "...", "em": <timestamp>}`.

## Publicar no GitHub Pages
Settings → Pages → Source: *Deploy from a branch* → Branch `main`, pasta `/ (root)` → Save. O link fica `https://<usuário>.github.io/orcamento-app/`.
