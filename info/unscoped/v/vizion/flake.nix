{

  inputs.packument.url   = "https://registry.npmjs.org/vizion?rev=58-993f02b9af9b21618bdda14ca40488dc";
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
    ident = "vizion";
    ldir  = "info/unscoped/v/vizion";
    inherit packument fetchInfo;
  } // latest';

}
