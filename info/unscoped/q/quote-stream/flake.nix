{

  inputs.packument.url   = "https://registry.npmjs.org/quote-stream?rev=10-457b27a50efdd4e5bdd662060ff9c89f";
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
    ident = "quote-stream";
    ldir  = "info/unscoped/q/quote-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
