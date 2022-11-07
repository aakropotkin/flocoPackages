{

  inputs.packument.url   = "https://registry.npmjs.org/flow-parser?rev=250-2b9c059a618d92dd82f9bdba4e6de6b9";
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
    ident = "flow-parser";
    ldir  = "info/unscoped/f/flow-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
