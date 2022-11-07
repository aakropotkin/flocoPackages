{

  inputs.packument.url   = "https://registry.npmjs.org/dom-serialize?rev=18-9e9af81b2b6caca6334d63c72b48ad63";
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
    ident = "dom-serialize";
    ldir  = "info/unscoped/d/dom-serialize";
    inherit packument fetchInfo;
  } // latest';

}
