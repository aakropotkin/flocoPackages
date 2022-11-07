{

  inputs.packument.url   = "https://registry.npmjs.org/http-deceiver?rev=17-c82fcb877ec1de6a3c1fb122154f9cf5";
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
    ident = "http-deceiver";
    ldir  = "info/unscoped/h/http-deceiver";
    inherit packument fetchInfo;
  } // latest';

}
