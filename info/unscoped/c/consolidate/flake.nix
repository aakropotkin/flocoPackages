{

  inputs.packument.url   = "https://registry.npmjs.org/consolidate?rev=180-8972df62a95970a760b738a455546530";
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
    ident = "consolidate";
    ldir  = "info/unscoped/c/consolidate";
    inherit packument fetchInfo;
  } // latest';

}
