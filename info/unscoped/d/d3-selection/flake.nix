{

  inputs.packument.url   = "https://registry.npmjs.org/d3-selection?rev=68-8f30a6844ffb1d35b0fbefb41f192944";
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
    ident = "d3-selection";
    ldir  = "info/unscoped/d/d3-selection";
    inherit packument fetchInfo;
  } // latest';

}
