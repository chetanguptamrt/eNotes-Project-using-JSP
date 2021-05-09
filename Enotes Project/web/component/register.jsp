<!-- Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="registerModalLabel"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign up</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form id="registerForm" name="registerForm">
            <div class="modal-body">
                <div class="container">
                    <div id="registerStatus" class="alert alert-warning" style="visibility: hidden; display: none;" role="alert"></div>
                    <div class="row pb-2">
                        <div class="col-4">Name</div>
                        <div class="col-8"><input type="text" name="registerName" placeholder="John Smith" size="30" value=""/></div>
                    </div>
                    <div class="row pb-2">
                        <div class="col-4">Email</div>
                        <div class="col-8"><input type="email" name="registerEmail" placeholder="John@example.com" size="30" value=""/></div>
                    </div>
                    <div class="row">
                        <div class="col-4">Password</div>
                        <div class="col-8"><input type="password" name="registerPassword" placeholder="password" size="30" value=""/></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Sign up</button>
            </div>
        </form>
    </div>
  </div>
</div>