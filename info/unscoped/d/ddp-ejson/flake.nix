{

  inputs.packument.url   = "https://registry.npmjs.org/ddp-ejson?rev=8-e0a61eaaac2fc178ee6d731430acf91d";
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
    ident = "ddp-ejson";
    ldir  = "info/unscoped/d/ddp-ejson";
    inherit packument fetchInfo;
  } // latest';

}
