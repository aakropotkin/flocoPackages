{

  inputs.packument.url   = "https://registry.npmjs.org/@antv/dom-util?rev=63-ff1a8c327d87f612e2c2c405b65ad5b4";
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
    scope = "@antv";
    ident = "@antv/dom-util";
    ldir  = "info/antv/dom-util";
    inherit packument fetchInfo;
  } // latest';

}
