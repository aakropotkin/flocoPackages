{

  inputs.packument.url   = "https://registry.npmjs.org/d3-dispatch?rev=37-0cb1b5bc5837861eaa1cb1bc9879c728";
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
    ident = "d3-dispatch";
    ldir  = "info/unscoped/d/d3-dispatch";
    inherit packument fetchInfo;
  } // latest';

}
