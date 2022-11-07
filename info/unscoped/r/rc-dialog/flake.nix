{

  inputs.packument.url   = "https://registry.npmjs.org/rc-dialog?rev=180-9a01b834088ffdf555f2565b2aa10a16";
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
    ident = "rc-dialog";
    ldir  = "info/unscoped/r/rc-dialog";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
