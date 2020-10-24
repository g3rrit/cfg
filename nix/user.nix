{ ... } : {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pear = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

}
