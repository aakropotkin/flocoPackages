{

  inputs.packument.url   = "https://registry.npmjs.org/@sinonjs/samsam?rev=43-f47b4cc91f0cc4d9380e7d48647ffc55";
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
    scope = "@sinonjs";
    ident = "@sinonjs/samsam";
    ldir  = "info/sinonjs/samsam";
    inherit packument fetchInfo;
  } // latest';

}
