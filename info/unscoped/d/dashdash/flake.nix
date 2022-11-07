{

  inputs.packument.url   = "https://registry.npmjs.org/dashdash?rev=60-ef0e9bf78742a68c5336400186b787df";
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
    ident = "dashdash";
    ldir  = "info/unscoped/d/dashdash";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
