{

  inputs.packument.url   = "https://registry.npmjs.org/sinon-chai?rev=102-77307856bd701712297f2dcff50ef5a0";
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
    ident = "sinon-chai";
    ldir  = "info/unscoped/s/sinon-chai";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
