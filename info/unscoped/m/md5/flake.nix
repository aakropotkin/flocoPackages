{

  inputs.packument.url   = "https://registry.npmjs.org/md5?rev=109-af162d61fef0eaa3d5d81ae17c6d461f";
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
    ident = "md5";
    ldir  = "info/unscoped/m/md5";
    inherit packument fetchInfo;
  } // latest';

}
