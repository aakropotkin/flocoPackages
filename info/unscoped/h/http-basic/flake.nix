{

  inputs.packument.url   = "https://registry.npmjs.org/http-basic?rev=59-f654633cb76f4b16c36d626e8848f9a2";
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
    ident = "http-basic";
    ldir  = "info/unscoped/h/http-basic";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
