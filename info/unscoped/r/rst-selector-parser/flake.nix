{

  inputs.packument.url   = "https://registry.npmjs.org/rst-selector-parser?rev=8-9d7e584a4f7bd8bf4590821534dc987e";
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
    ident = "rst-selector-parser";
    ldir  = "info/unscoped/r/rst-selector-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
