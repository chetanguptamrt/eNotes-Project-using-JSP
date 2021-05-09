<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form id="loginForm" name="loginForm">
            <div class="modal-body">
                <div class="container">
                    <div id="loginStatus" class="alert alert-warning" style="visibility: hidden; display: none;" role="alert"></div>

                    <div class="row pb-2">
                        <div class="col-4">Email</div>
                        <div class="col-8"><input type="email" name="loginEmail" placeholder="John@example.com" size="30" value=""/></div>
                    </div>
                    <div class="row">
                        <div class="col-4">Password</div>
                        <div class="col-8"><input type="password" name="loginPassword" placeholder="password" size="30" value=""/></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="Submit" class="btn btn-primary">Login</button>
            </div>
        </form>
    </div>
  </div>
</div>