data Achado = Achado
 {
  ondeAchou :: String ,
  quandoAchou :: String ,
  quemAchou :: String ,
  nomeObjeto :: String ,
  descricao :: String ,
  categoria :: String
 }deriving Show

main :: IO()
main = do
 
 programa 11 []
 -- let bola = Achado {ondeAchou = "LCC2", 
 --                    quandoAchou = "01/01/2019",
 --                    quemAchou = "Victor",
 --                    nomeObjeto = "Bola",
 --                    descricao = "E quadrada",
 --                    categoria = "Brinquedo"
 --                   }
 -- let caneta = Achado {ondeAchou = "LCC3", 
 --                    quandoAchou = "05/01/2019",
 --                    quemAchou = "Ciro",
 --                    nomeObjeto = "Caneta",
 --                    descricao = "E Azul",
 --                    categoria = "Caneta"
 --                   } 
 -- let achados = adicionaAchado (adicionaAchado novo bola) caneta
 -- mapM_ print achados



adicionaAchado :: [Achado] -> Achado -> [Achado]
adicionaAchado [] novo = [novo] 
adicionaAchado (x:xs) novo = [x] ++ (adicionaAchado xs novo)


programa :: Int -> [Achado] ->  IO()
programa 0 _ = do
 putStrLn ""
 putStrLn "Fim do Programa"

programa 11 achados = do
 
 putStrLn ""
 putStrLn "Escolha a opcao:"
 putStrLn "1 - Cadastro de Objetos Perdidos"
 putStrLn "2 - Cadastro de Objetos Achados"
 putStrLn "3 - Lista de Objetos Perdidos"
 putStrLn "4 - Lista de Objetos Achados"
 putStrLn "5 - Lista de Objetos Perdidos por Categoria"
 putStrLn "6 - Lista de Objetos Encontrados por Categoria"
 putStrLn "7 - Busca por Nome do Objeto"
 putStrLn "8 - Busca por Pessoa que Perdeu"
 putStrLn "9 - Busca por Pessoa que Encontrou"
 putStrLn "10 - Popular Database"
 putStrLn ""
 putStrLn "Digite 0 para sair do sistema e encerrar todas as operacoes"
 putStrLn "Digite sua opcao......."
 putStrLn ""
 
 opcao <- readLn :: IO Int
 operacoes opcao achados

programa _ achados = do
 putStrLn ""
 putStrLn "Operacao Invalida"
 putStrLn ""
 programa 11 achados


operacoes :: Int -> [Achado] -> IO()

-- operacoes 1 achados = do

operacoes 2 achados = do
 
 --Cadastrar Objeto Achado 
 putStrLn ""
 putStrLn "Local que Encontrou:"
 localEnc <- getLine
 putStrLn ""
 putStrLn "Data que Encontrou:"
 dataEnc <- getLine
 putStrLn ""
 putStrLn "Nome de quem Encontrou:"
 nomeQuemEnc <- getLine
 putStrLn ""
 putStrLn "Nome do Objeto:"
 nomeObjEnc <- getLine
 putStrLn ""
 putStrLn "Descreva o Objeto em Algumas Linhas:"
 descricaoEnc <- getLine
 putStrLn ""
 putStrLn "Categoria do Objeto:"
 categoriaEnc <- getLine
 putStrLn ""
 --cria o novo objeto achado
 let novoAchado = Achado {ondeAchou = localEnc, 
                       quandoAchou = dataEnc,
                       quemAchou = nomeQuemEnc,
                       nomeObjeto = nomeObjEnc,
                       descricao = descricaoEnc,
                       categoria = categoriaEnc
                      }
 programa 11 (adicionaAchado achados novoAchado)


-- operacoes 3 = do

operacoes 4 achados= do

 -- Lista dos  Objetos Achados
 putStrLn ""
 imprimirAchados achados

-- operacoes 5 = do

-- operacoes 6 = do

-- operacoes 7 = do

-- operacoes 8 = do

-- operacoes 9 = do

-- operacoes 10 = do

operacoes _ achados = do
 programa 11 achados



imprimirAchados :: [Achado] -> IO()
imprimirAchados [] = do
 putStrLn ""
 putStrLn "Fim da Lista"
 putStrLn ""
imprimirAchados (x:xs) = do
 putStrLn ""
 putStrLn (printLocalAchado x)
 putStrLn (printDataAchado x)
 putStrLn (printQuemAchado x)
 putStrLn (printNomeObjAchado x)
 putStrLn (printDescricaoAchado x)
 putStrLn (printCategoriaAchado x)
 putStrLn ""
 imprimirAchados xs




printLocalAchado :: Achado -> String
printLocalAchado (Achado {ondeAchou = onde} ) = "O Objeto foi encontrado  em: " ++ onde

printDataAchado :: Achado -> String
printDataAchado (Achado {quandoAchou = quando} ) = "Data: " ++ quando

printQuemAchado :: Achado -> String
printQuemAchado (Achado {quemAchou = quem } ) = "Achado por:" ++ quem

printNomeObjAchado :: Achado -> String
printNomeObjAchado (Achado {nomeObjeto = nome} ) = "Nome do Objeto:" ++ nome 

printDescricaoAchado :: Achado -> String
printDescricaoAchado (Achado {descricao = desc} ) = "Descricao do Objeto:" ++ desc 

printCategoriaAchado :: Achado -> String
printCategoriaAchado (Achado {categoria = cate} ) = "Categoria do Objeto: " ++ cate 