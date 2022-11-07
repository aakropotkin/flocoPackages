{

  inputs.packument.url   = "https://registry.npmjs.org/html-escaper?rev=13-6ddb9ba96f4c499910685f32ce24933d";
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
    ident = "html-escaper";
    ldir  = "info/unscoped/h/html-escaper";
    inherit packument fetchInfo;
  } // latest';

}
