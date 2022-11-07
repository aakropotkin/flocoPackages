{

  inputs.packument.url   = "https://registry.npmjs.org/syntax-error?rev=44-96502989e5111e3e7bdb77e9ef75533c";
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
    ident = "syntax-error";
    ldir  = "info/unscoped/s/syntax-error";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
