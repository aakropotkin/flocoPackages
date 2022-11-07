{

  inputs.packument.url   = "https://registry.npmjs.org/braces?rev=65-e8f6b98b84bc30d607fedae5ff7e5e11";
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
    ident = "braces";
    ldir  = "info/unscoped/b/braces";
    inherit packument fetchInfo;
  } // latest';

}
