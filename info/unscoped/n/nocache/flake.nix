{

  inputs.packument.url   = "https://registry.npmjs.org/nocache?rev=21-e450f679ced9de65d52adeb201f2172d";
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
    ident = "nocache";
    ldir  = "info/unscoped/n/nocache";
    inherit packument fetchInfo;
  } // latest';

}
