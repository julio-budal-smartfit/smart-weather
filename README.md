# Desafio de Back-End - GitHub
Bem-vindo ao desafio de Back-End da Smartfit. Sua tarefa é refatorar uma funcionalidade existente, aplicando boas práticas de programação e seguindo as diretrizes descritas abaixo.

## Descrição do Projeto
Atualmente, a Smartfit possui uma tela que exibe apenas a temperatura atual da região. O objetivo desta refatoração é ampliar essa funcionalidade para que a tela exiba a média de temperatura para os próximos 5 dias para a região.

### Regra de Negócio:
A tela deve mostrar a média horária da temperatura para os próximos 5 dias, utilizando os dados fornecidos pela API.
Utilize a API do OpenWeather para buscar as informações necessárias. Se o token de API ainda não estiver disponível, você pode usar o exemplo de token no arquivo .env.sample.

### Critérios de Avaliação
Vamos avaliar o seu trabalho com base nos seguintes critérios:

- Conhecimento em Rails: Estruturação correta e uso adequado do framework.
- Código Limpo: Legibilidade, organização e clareza do código.
- Organização do Projeto: Boa estruturação de pastas, arquivos e lógica.
- Testes Automatizados: Implementação de testes que garantam a qualidade do código.
- Tratamento de Erros: Soluções para lidar com falhas, como problemas na API.
- Performance: Eficiência do código e boas práticas de otimização.
- Documentação: Instruções claras para rodar o projeto e compreensão do código.
- Depuração: Habilidade em identificar e corrigir problemas no código.

# Setup do Projeto

Para configurar o ambiente de desenvolvimento, utilize o Docker. Abaixo, instruções para configurar e rodar o projeto usando o Visual Studio Code ou linha de comando.

## Usando o VS Code:

1. Abra o projeto no VS Code.
2. Instale a extensão Dev Containers.
3. O VS Code deve detectar automaticamente a configuração e sugerir a opção "Reopen in Container". Clique nesta opção. (Se não aparecer, use Ctrl + P e selecione "Rebuild and Reopen in Container".)
4. O build do container será iniciado e o ambiente de desenvolvimento será configurado.
5. cp .env.sample .env
6. Dentro do contêiner, execute bin/dev para iniciar o projeto.

## Considerações Finais

- Atualmente, a tela mostra apenas a temperatura atual. A refatoração solicitada é para exibir a média de temperatura por hora para os próximos 5 dias.
- Use a documentação da API para consulta.
- Se precisar de ajuda, entre em contato.

Estamos ansiosos para avaliar sua solução. Boa sorte!

