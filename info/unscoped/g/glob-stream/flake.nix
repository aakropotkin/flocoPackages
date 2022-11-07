{

  inputs.packument.url   = "https://registry.npmjs.org/glob-stream?rev=121-ef417b53ec70cceb84f3aa8e30ab1e53";
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
    ident = "glob-stream";
    ldir  = "info/unscoped/g/glob-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
