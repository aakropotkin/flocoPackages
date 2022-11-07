{

  inputs.packument.url   = "https://registry.npmjs.org/password-prompt?rev=15-398e1040656ac73bc952e80a63e01f72";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "password-prompt";
    ldir  = "info/unscoped/p/password-prompt";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
