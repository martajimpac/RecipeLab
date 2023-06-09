<%--
    Document   : buscador
    Created on : 17 abr 2023, 22:25:26
    Author     : marta
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Math"%>
<%@page import="Modelo.Receta"%>
<%@page import="Datos.RecetaDB"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <!-- ***************************************************************************************************************** -->
    <!-- Buscador                                                                                                          -->
    <!-- ***************************************************************************************************************** -->

    <form class="buscador" method="POST" action="BuscadorServlet"> <!--Llamar aqui al servlet -->
        <input type="text" name="form-texto" placeholder="Buscar...">
        <select class="botonDesplegable" name="tipo-busqueda" id="tipo-busqueda">
            <option value="recetas"> Recetas </option>
            <option value="personas"> Personas </option>
        </select>
        <button id="buscarRecetas" class="btn btn-secondary"  type="submit" >Buscar</button>

    <!-- Ver filtros -->
    <p>
        <a class="botonDesplegable" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Ver filtros<img class="flecha" src="images/flecha_abajo.png" alt="logo"/>
        </a>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="card card-body filtros">

            <div class="container text-center" id="divfiltros">
                <div class="row">
                        <div class="col">
                            <label for="precio">Precio máximo:  </label>
                            <input id="precio" type="range" class="filtro-slider" name="form-precio" min="0" max="50" step="1">
                            <p>Valor: <span id="valor-precio"></span></p>
                        </div>
                        <div class="col">
                            <label for="duracion">Duración máxima:  </label>
                            <input id="duracion" type="range" class="filtro-slider" name="form-duracion" min="0" max="10000" step="1">
                            <p>Valor: <span id="valor-duracion"></span></p>
                        </div>
                    </div>

                <div class="row">
                    <div class="col">
                        <span>Categoría</span>
                        <select name="form-categoria" class="botonDesplegable" name="busqueda">
                            <option value="-1" selected> Elegir</option>
                            <option value="desayuno"> Desayuno</option>
                            <option value="comida"> Comida</option>
                            <option value="cena"> Cena</option>
                            <option value="snack"> Snack</option>
                            <option value="postre"> Postre</option>
                        </select>
                    </div>
                    <div class="col">
                        <span>Nº comensales</span>
                        <select name="form-comensales" class="botonDesplegable" name="busqueda">
                            <option value="-1" selected> Elegir</option>
                            <option value="1"> 1    </option>
                            <option value="2"> 2    </option>
                            <option value="3"> 3    </option>
                            <option value="4"> 4    </option>
                            <option value="5"> 5    </option>
                            <option value="6"> 6    </option>
                            <option value="7"> 7    </option>
                            <option value="8"> 8    </option>
                            <option value="9"> 9    </option>
                            <option value="10"> 10    </option>
                        </select>
                    </div>
                    <div class="col">
                        <span>Dificultad</span>
                        <select name="form-dificultad" class="botonDesplegable" name="busqueda">
                            <option value="-1" selected> Elegir</option>
                            <option value="facil"> Fácil </option>
                            <option value="media"> Media </option>
                            <option value="dificil"> Difícil </option>
                        </select>
                    </div>
                    <div class="col">
                        <div class="rating">
                            <input type="radio" id="star1" name="rating" value="5" /><label for="star1"></label>
                            <input type="radio" id="star2" name="rating" value="4" /><label for="star2"></label>
                            <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
                            <input type="radio" id="star4" name="rating" value="2" /><label for="star4"></label>
                            <input type="radio" id="star5" name="rating" value="1" /><label for="star5"></label>
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

<%   ArrayList<Receta> recomendaciones = new ArrayList<>();
        //recuperar los datos
        try{
            recomendaciones = RecetaDB.buscaRecetasPorNombre("");
        }catch(Exception e){
            System.out.println(e);
        }

        Iterator<Receta> iter;

        //eliminar de la lista los elementos que no cumplan la condicion
        iter = recomendaciones.iterator();
        while (iter.hasNext()) {
            Receta receta = iter.next();

            //eliminamos las recetas que tengan menor valoracion que la selecionada
            if (receta.getValoracionMedia() < 3) {
                iter.remove();
            }
        }

        //Elejimos tres recetas aleatoriamente
        ArrayList<Receta> recetasAleatorias = new ArrayList<>();
        Random random = new Random();

        int numRecetasSeleccionadas = Math.min(recomendaciones.size(), 3);

        for (int i = 0; i < numRecetasSeleccionadas; i++) {
            int indiceAleatorio = random.nextInt(recomendaciones.size());
            Receta recetaSeleccionada = recomendaciones.get(indiceAleatorio);
            recetasAleatorias.add(recetaSeleccionada);
            recomendaciones.remove(indiceAleatorio);
        }

    String carouselclass = null;
    if(recomendaciones!=null){
        for(int i=0; i<recetasAleatorias.size();i++){
            Receta r = recetasAleatorias.get(i);
            int id = r.getId();
            if(i == 0){
                carouselclass = "carousel-item active";

            }else{
                carouselclass = "carousel-item";
            }
     %>
            <div class= "<%=carouselclass %>" >
                <a href="VerRecetaServlet?id=<%= id %>">
                    <img src="<%=r.getUrlImagen()%>" class="d-block w-100" alt="slider2">
                    <div class="div-sobre-imagen">
                        <h5> <%=r.getNombre() %> </h5>
                        <div class="info-receta">
                            <div class="item">
                                <% for(int estrellas=0; estrellas<r.getValoracionMedia(); estrellas++){ %>
                                     <img src="./images/estrella.png" alt="valoracion">
                                <%} %>
                            </div>
                            <div class="item">
                                <img src="images/personas.png" alt="numero personas">
                                <p> <%=r.getNumPersonas() %> </p>
                            </div>
                            <div class="item">
                                <img src="./images/reloj.png" alt="duracion">
                                <% int segundos = r.getDuracionEnSec();
                                   int hor=segundos/3600;
                                   int min=(segundos-(3600*hor))/60;
                                   String tiempo = hor+"h "+min+"m ";
                                %>
                                <p> <%=tiempo %> </p>
                            </div>
                            <div class="item">
                                <strong> <%=r.getPrecio() %>€ </strong>
                            </div>
                            <div class="item">
                                <p> <%=r.getDificultad() %> </p>
                            </div>
                            <div class="item">
                                <p> Los ingredientes están disponibles</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
<%      } //del for
    }else{//del if %>

        <div class="carousel-item active">
            <a href="receta.jsp">
                <img src="./images/slider1.jpg" class="d-block w-100" alt="slider1">
            </a>
        </div>
   <% } %>

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

