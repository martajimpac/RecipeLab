<%-- 
    Document   : buscador
    Created on : 17 abr 2023, 22:25:26
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <!-- ***************************************************************************************************************** -->
    <!-- Buscador                                                                                                          -->
    <!-- ***************************************************************************************************************** -->

    <form class="buscador" method="POST" action="BuscarUsuariosServlet"> <!--Llamar aqui al servlet -->
        <input type="text" name="busqueda" placeholder="Buscar...">
        <select class="botonDesplegable" name="busqueda">
            <option value=""> Recetas </option>
            <option value="1"> Personas </option>
        </select>
                <button onclick="document.location='resultadosRecetas.html'" id="buscarRecetas" class="btn btn-secondary"  type="submit" >Buscar</button>

    <!-- Ver filtros -->
    <p>
        <a class="botonDesplegable" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Ver filtros<img class="flecha" src="images/flecha_abajo.png" alt="logo"/>
        </a>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body filtros">

            <div class="container text-center">
                <div class="row">
                    <div class="col">
                        <label for="precio-slider">Precio:</label>
                        <input type="range" class="filtro-slider" id="precio-slider" min="0" max="100" value="50" step="1">
                        <p>Valor: <span id="precio-value"></span> €</p>
                    </div>
                    <div class="col">
                        <label for="duracion-slider">Duración:</label>
                        <input type="range" class="filtro-slider" id="duracion-slider" min="0" max="100" value="50" step="1">
                        <p>Valor actual: <span id="duracion-value"></span>h</p>
                        <!--TODO añadir javascript para terminar esto-->
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <span id="categoria-texto">Ingredientes</span>
                        <select id="categoria-selector" class="botonDesplegable" name="busqueda"> <!--TODO: TERMINAR ESTO, COMO PONER UNA OPCION POR DEFECTO?-->
                            <option value="0"> Desayuno</option>
                            <option value="1"> Comida</option>
                            <option value="2"> Cena</option>
                            <option value="3"> Snack</option>
                            <option value="4"> Postre</option>
                        </select>
                    </div>
                    <div class="col">
                        <span id="dificultad-texto">Dificultad</span>
                        <select id="dificultad-selector" class="botonDesplegable" name="busqueda">
                            <option value="1" selected> Fácil </option>
                            <option value="2"> Media </option>
                            <option value="3"> Difícil </option>
                        </select>
                    </div>
                    <div class="col">
                        <div class="rating">
                            <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
                            <input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
                            <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
                            <input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
                            <input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    
    <!-- ***************************************************************************************************************** -->
    <!-- Slider                                                                                                            -->
    <!-- ***************************************************************************************************************** -->
    <p class="display-6">Recomendaciones</p>

    <div id="carousel" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="receta.jsp">
                    <img src="./images/slider1.jpg" class="d-block w-100" alt="slider1">
                    <div class="div-sobre-imagen">
                        <h5> Nombre receta </h5>
                         <div class="info-receta">
                             <div class="item">
                                 <img src="./images/estrella.png" alt="valoracion">
                                 <img src="./images/estrella.png" alt="valoracion">
                                 <img src="./images/estrella.png" alt="valoracion">
                             </div>
                             <div class="item">
                                 <img src="images/personas.png" alt="numero personas">
                                 <p> Número de comensales </p>
                             </div>
                             <div class="item">
                                 <img src="./images/reloj.png" alt="duracion">
                                 <p> Duración </p>
                             </div>
                             <div class="item">
                                <strong> €€ </strong>
                             </div>
                             <div class="item">
                                <p> Fácil </p>
                             </div>
                             <div class="item">
                                <p> Los ingredientes están disponibles</p>
                             </div>
                         </div>
                    </div>
                </a>
            </div>
            <div class="carousel-item">
                <a href="receta.jsp">
                    <img src="./images/slider2.jpg" class="d-block w-100" alt="slider2">
                    <div class="div-sobre-imagen">
                        <h5> Nombre receta </h5>
                        <div class="info-receta">
                            <div class="item">
                                <img src="./images/estrella.png" alt="valoracion">
                                <img src="./images/estrella.png" alt="valoracion">
                                <img src="./images/estrella.png" alt="valoracion">
                            </div>
                            <div class="item">
                                <img src="images/personas.png" alt="numero personas">
                                <p> Número de comensales </p>
                            </div>
                            <div class="item">
                                <img src="./images/reloj.png" alt="duracion">
                                <p> Duración </p>
                            </div>
                            <div class="item">
                                <strong> €€ </strong>
                            </div>
                            <div class="item">
                                <p> Fácil </p>
                            </div>
                            <div class="item">
                                <p> Los ingredientes están disponibles</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="carousel-item">
                <a href="receta.jsp">
                    <img src="./images/slider3.jpg" class="d-block w-100" alt="slider3">
                    <div class="div-sobre-imagen">
                        <h5> Nombre receta </h5>
                        <div class="info-receta">
                            <div class="item">
                                <img src="./images/estrella.png" alt="valoracion">
                                <img src="./images/estrella.png" alt="valoracion">
                                <img src="./images/estrella.png" alt="valoracion">
                            </div>
                            <div class="item">
                                <img src="images/personas.png" alt="numero personas">
                                <p> Número de comensales </p>
                            </div>
                            <div class="item">
                                <img src="./images/reloj.png" alt="duracion">
                                <p> Duración </p>
                            </div>
                            <div class="item">
                                <strong> €€ </strong>
                            </div>
                            <div class="item">
                                <p> Fácil </p>
                            </div>
                            <div class="item">
                                <p> Los ingredientes están disponibles</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
