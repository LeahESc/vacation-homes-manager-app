  <nav class="navbar navbar-light" style="background-color: #212b3b;"> 
        <a class="navbar-brand" href="/">Home</a>
        <div class="form-inline">
      <a class="nav-link active" color= "#ffeacc;"  href="/users/sign_up">Signup</a>
      <a class="nav-link active" href="/login">Login</a>
        <div class="form-inline">
        <a class="nav-link active" href="/logout">Logout</a>
      </div>
      </div>
      </nav>



      <%= f.fields_for :amenities_ids do |p_amenity|  %>
   <%= p_amenity.label "Amenities:" %> <br>
 
      <%= p_amenity.collection_check_boxes :amenities_ids%> 
    <% end %>