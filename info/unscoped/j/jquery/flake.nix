{

  inputs.packument.url   = "https://registry.npmjs.org/jquery?rev=674-5bf47dedbbc9cbea7b1fe5126b75769f";
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
    ident = "jquery";
    ldir  = "info/unscoped/j/jquery";
    inherit packument fetchInfo;
  } // latest';

}
